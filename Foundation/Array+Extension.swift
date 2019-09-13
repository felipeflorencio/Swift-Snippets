//
//  Array+Extension.swift
//
//  Created by Felipe Florencio Garcia on 06/08/18.
//  Copyright © 2018 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

public extension Array {
    
    // Very helpful helper in order to get a item from array in safe way
    // that you don't need to first check if indice is there and access
    // latter, just set the indice and will return if array have
    /* How to use:
       let exampleArray = ["item1", "item2", "item3", "item4", "item5", "item6"]
       let returnIfExist = exampleArray[safe: 3]
    
      If not there will return nil, so you can use with 'guard' to
     */
    public subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }  
}

    // If you have one array and want to remove duplicated itens from him, you can
    // easily use this helper functionar that will do this for you 
    // How to use
    // let array = [1, 2, 3, 3, 2, 1, 4]
    // array.unify() // [1, 2, 3, 4]

public extension Array where Element: Hashable {
    public mutating func unify() {
        self = unified()
    }
}

public extension Collection where Element: Hashable {
    public func unified() -> [Element] {
        return reduce(into: []) {
            if !$0.contains($1) {
                $0.append($1)
            }
        }
    }
}
