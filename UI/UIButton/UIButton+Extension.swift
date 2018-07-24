//
//  UIButton+Extension.swift
//  
//  Created by Felipe Florencio Garcia on 24/07/18.
//  Copyright © 2018 Felipe Garcia. All rights reserved.
//

import UIKit

extension UIButton {
    
    /* Create the button as usual, can be at storyboard or programmatically, and before
       show the button you just need to call the function and set the parameters:
       Parameters:
       - spacing: CGFloat = the space between image and the text
       - name: String = The image name;
       Example:
       let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
       button.centerImageAndTextVerticaAlignment(spacing: 10, image: "my_image_name")
     */
    public func centerImageAndTextVerticaAlignment(spacing: CGFloat, image name: String) {
        setImage(UIImage(named: name), for: .normal)
        let insetAmount = spacing / 2
        let writingDirection = UIApplication.shared.userInterfaceLayoutDirection
        let factor: CGFloat = writingDirection == .leftToRight ? 1 : -1
        
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -(insetAmount * factor), bottom: 0, right: (insetAmount * factor))
        titleEdgeInsets = UIEdgeInsets(top: 0, left: (insetAmount * factor), bottom: 0, right: -(insetAmount * factor))
        contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
}
