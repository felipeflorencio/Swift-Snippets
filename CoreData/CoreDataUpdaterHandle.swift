//
//  CoreDataUpdaterHandle.swift
//
//  Created by Felipe Florencio Garcia on 03/07/18.
//  Copyright © 2018 Felipe Florencio Garcia. All rights reserved.
//

/*
    It's a good practice create a protocol and the variable's, functions
    be declared there and conform this class with the protocol
*/

import Foundation
import CoreData

enum DatabaseUpdateType {
    case inserted([Any])
    case updated([Any])
    case deleted([Any])
}

protocol DatabaseObjectUpdateProtocol {
    func databaseObjectChanged(data updated: DatabaseUpdateType)
}

class CoreDataUpdaterHandle<T> {

    private(set) var notificationCenter: NotificationCenter = NotificationCenter.default
    private(set) var coreDataContext: NSManagedObjectContext
    var updateDelegate: DatabaseObjectUpdateProtocol?

    required init(coredata context: NSManagedObjectContext){
        coreDataContext = context

        notificationCenter.addObserver(self,
                                       selector: #selector(configureNotificationHandler(_:)),
                                       name: Notification.Name.NSManagedObjectContextObjectsDidChange,
                                       object: coreDataContext)
    }

    // Must need in order to avoid retain cycles
    deinit {
        notificationCenter.removeObserver(self)
    }

    @objc internal func configureNotificationHandler(_ notification: Notification) {
        guard let dataInfo = notification.userInfo else { return }

        if let inserts = dataInfo[NSInsertedObjectsKey] as? Set<NSManagedObject> {
            var insertedItem = false
            var dataList = [T]()
            for insert in inserts {
                if let data = insert as? T {
                    dataList.append(data)
                    insertedItem = true
                }
            }

            // call the delegate
            if insertedItem {
                updateDelegate?.databaseObjectChanged(data: .inserted(dataList))
            }
        }

        if let updates = dataInfo[NSUpdatedObjectsKey] as? Set<NSManagedObject> {
            var updatedItem = false
            var dataList = [T]()
            for update in updates {
                if let data = update as? T {
                    dataList.append(data)
                    updatedItem = true
                }
            }
            // call the delegate
            if updatedItem {
                updateDelegate?.databaseObjectChanged(data: .updated(dataList))
            }
        }

        if let deletes = dataInfo[NSDeletedObjectsKey] as? Set<NSManagedObject> {
            var deletedItem = false
            var dataList = [T]()
            for delete in deletes {
                if let data = delete as? T {
                    dataList.append(data)
                    deletedItem = true
                }
            }
            // call the delegate
            if deletedItem {
                updateDelegate?.databaseObjectChanged(data: .deleted(dataList))
            }
        }
    }
}
