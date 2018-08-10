//
//  UIView+Extension.swift
//
//  Created by Felipe Florencio Garcia on 14/07/18.
//  Copyright © 2018 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

public extension UIView {
    
    // This can be used on any item the inheritance from UIView, for example UIButton
    // can be accessed from storyboard or even on your code
    
    // MARK: IBInspectable
    // Set border with from storyboard
    @IBInspectable public var borderWith: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    // Set border color from storyboard
    @IBInspectable public var borderColor: UIColor? {
        get {
            if let CGColor = layer.borderColor {
                return UIColor(cgColor: CGColor)
            } else {
                return nil
            }
        }
        set { layer.borderColor = newValue?.cgColor }
    }
    
    // Add corner radious from storboard
    @IBInspectable public var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.masksToBounds = newValue > 0
            layer.cornerRadius = newValue
            self.clipsToBounds = true
        }
    }
}
