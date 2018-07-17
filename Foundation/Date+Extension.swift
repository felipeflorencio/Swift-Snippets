//
//  Date+Extension.swift
//
//  Created by Felipe Florencio Garcia on 12/07/18.
//  Copyright © 2018 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

public extension Date {
    
    // Private variable to be able hold the value as extension can't have computed
    // property with default values, there's another way that I will provide soon here
    private static var _customFormater = "dd/MM/YYYY"
    
    public var customFormater: String {
        get {
            return Date._customFormater
        }
        set {
            Date._customFormater = newValue
        }
    }
    
    public func formatedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = customFormater
        return dateFormatter.string(from: self)
    }
    
    /* Example how to use
     * var todayDate = Date()
     * todayDate.customFormater = "MM/dd/YY" // If need set a custom formater
     * var todayString = todayDate.formatedDate() // Get the formated string according to our formater
     */
}
