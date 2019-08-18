//
//  Dictionary+Extension.swift
//
//  Created by Felipe Florencio Garcia on 06/08/18.
//  Copyright © 2018 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

public extension Dictionary {
    
    // Example how to use:
    // let value = try data.value(key: "customKey", type: String.self)
    func value<T>(key: Key, type: T.Type) throws -> T {
        guard let value = self[key] as? T else {
            throw NSError()
        }
        return value
    }
}