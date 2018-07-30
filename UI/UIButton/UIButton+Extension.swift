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
    
    /* It's a helper function when you need to rotate a button, for example
       in a camera button tha you would like to rotate the button according
       to the device orientation.
       Create the button as usual, can be at storyboard or programmatically,
       and before show the button you just need to call the function:
       Example:
       let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
       button.applyButtonRotation()
     */
    public func applyButtonRotation() {
		let identity = CATransform3DIdentity

		func rotation() -> CATransform3D {

			switch UIDevice.current.orientation {
			case .landscapeLeft:
				return identity.rotate(by: CGFloat.pi / 2)
			case .landscapeRight:
				return identity.rotate(by: -CGFloat.pi / 2)
			case .portrait:
				return identity
			default:
				return layer.transform
			}
		}

		if isSelected || isHighlighted {
			UIView.animate(withDuration: 0.2) {
				self.layer.transform = rotation().scaled(by: 1.2)
			}
		} else {
			UIView.animate(withDuration: 0.2) {
				self.layer.transform = rotation()
			}
		}
	}
}

// Helper to the rotation button
extension CATransform3D {
	func rotate(by angle: CGFloat) -> CATransform3D {
		return CATransform3DRotate(self, angle, 0, 0, 1)
	}

	func scaled(by scale: CGFloat) -> CATransform3D {
		return CATransform3DScale(self, scale, scale, 1)
	}
}
