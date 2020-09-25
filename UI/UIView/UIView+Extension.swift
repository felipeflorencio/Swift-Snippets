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
        Borders.forEach { vBorder in
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
    
    func shake(duration timeDuration: Double = 0.07, repeat countRepeat: Float = 3){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = timeDuration
        animation.repeatCount = countRepeat
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
    
    // Select where you want to add corner radius
    // Sample:
    // let view = UIView()
    // view.roundCorners(corners: [.topLeft, .topRight], radius: 2)
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.frame = bounds
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    // Add Loader to your view
    static let loadingViewTag = 1938123987

    func showLoading(style: UIActivityIndicatorView.Style = .gray) {
        var loading = viewWithTag(UIView.loadingViewTag) as? UIActivityIndicatorView
        if loading == nil {
            loading = UIActivityIndicatorView(style: style)
        }

        loading?.translatesAutoresizingMaskIntoConstraints = false
        loading!.startAnimating()
        loading!.hidesWhenStopped = true
        loading?.tag = UIView.loadingViewTag
        addSubview(loading!)
        loading?.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        loading?.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func stopLoading() {
        let loading = viewWithTag(UIView.loadingViewTag) as? UIActivityIndicatorView
        loading?.stopAnimating()
        loading?.removeFromSuperview()
    }
    
    // This is a helper to get the rect from a view in relation of another view
    // very useful when you want get the where a view are in relation to super view
    // One of the uses is you want to show a popover from a touch in a table view cell
    // in relation of you view controller.
    // How to use it:
    // view1.convertedFrame(from: view2)
    func convertedFrame(from subview: UIView) -> CGRect? {
        // check if `subview` is a subview of self
        guard subview.isDescendant(of: self) else {
            return nil
        }

        var frame = subview.frame
        if subview.superview == nil {
            return frame
        }

        var superview = subview.superview
        while superview != self {
            frame = superview!.convert(frame, to: superview!.superview)
            if superview!.superview == nil {
                break
            } else {
                superview = superview!.superview
            }
        }

        return superview!.convert(frame, to: self)
    }
}
