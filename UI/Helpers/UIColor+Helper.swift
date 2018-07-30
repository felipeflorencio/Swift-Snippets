//
//  UIColor+Helper.swift
//  UI
//
//  Created by Felipe Garcia on 30/07/2018.
//  Copyright © 2018 Felipe Garcia. All rights reserved.
//

import UIKit

extension UIColor {

    /**
     Hex string of a UIColor instance.

     - parameter includeAlpha: Whether the alpha should be included.
     */
    public func hexString(_ includeAlpha: Bool = false) -> String? {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)

        guard r >= 0 && r <= 1 && g >= 0 && g <= 1 && b >= 0 && b <= 1 else {
            return nil
        }

        if includeAlpha {
            return String(format: "#%02X%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255), Int(a * 255))
        } else {
            return String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
        }
    }
}
