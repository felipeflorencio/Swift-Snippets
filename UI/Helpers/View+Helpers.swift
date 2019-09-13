//
//  View+Helpers.swift
//
//  Created by Felipe Florencio Garcia on 16/07/18.
//  Copyright © 2018 Felipe Garcia. All rights reserved.
//

import UIKit

class ViewHelpers: NSObject {

    // Load the nib using the view controller name and the bundle where
    // you class are in the package :D
    // Example:
    // Class name: ViewTestForLoadNib.swift
    // Do this: `let viewFromNib = ViewTestForLoadNib.loadFromNib()`
    // This will return the nib file that you want to load
    class public func loadFromNib<T: UIViewController>() -> T {
        return T(nibName: String(describing: self), bundle: Bundle(for: T.self))
    }
    
    // Get the top UIViewController anywhere
    func getTopViewController() -> UIViewController? {
        var topController = UIApplication.shared.keyWindow?.rootViewController
        while ((topController?.presentedViewController) != nil) {
            topController = topController?.presentedViewController
        }
        
        return topController
    } 
}
