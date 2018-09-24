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
    
    // Add border to a specific position
    enum viewBorder: String {
        case Left = "borderLeft"
        case Right = "borderRight"
        case Top = "borderTop"
        case Bottom = "borderBottom"
    }
    
    // With this function you will be able to add border to a specific position or all sides
    // any object that inherit from UIView can be used, just call this as a function on your
    // UIView type object setting the parameters that you want
    // For example:
    // 'you view object reference'.addBorder(view: [.Bottom])
    // As you can see we have some default values so onyl set if really need
    func addBorder(view Borders: [viewBorder], color: UIColor = UIColor.lightGray, width: CGFloat = 1.0) {
        vBorders.forEach { vBorder in
            let border = CALayer()
            border.backgroundColor = color.cgColor
            border.name = vBorder.rawValue
            switch vBorder {
            case .Left:
                border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
            case .Right:
                border.frame = CGRect(x:self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
            case .Top:
                border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
            case .Bottom:
                border.frame = CGRect(x: 0, y: self.frame.size.height - width , width: self.frame.size.width, height: width)
            }
            self.layer.addSublayer(border)
        }
    }
}