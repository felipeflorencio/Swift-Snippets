//
//  UIImage+Extension.swift
//  
//
//  Created by Felipe Florencio Garcia on 24/07/18.
//  Copyright © 2018 Felipe Garcia. All rights reserved.
//

import UIKit

extension UIImage {
    
    /* Just create your image as usual and call this method to generate a new image
       but now with the tint colour that you applied, but remember, if the image is from
       .xcassets you need to set the image set at "Render as" to "Template", otherwise
       you could not see the changes
       Example:
       let tintedImage = UIImage(named: "my_image").tinted(UIColour.red)
     */
    func tinted(color: UIColor) -> UIImage {
        
        UIGraphicsBeginImageContext(self.size)
        guard let context = UIGraphicsGetCurrentContext() else { return self }
        guard let cgImage = cgImage else { return self }
        
        // flip the image
        context.scaleBy(x: 1.0, y: -1.0)
        context.translateBy(x: 0.0, y: -size.height)
        
        // multiply blend mode
        context.setBlendMode(.multiply)
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        context.clip(to: rect, mask: cgImage)
        color.setFill()
        context.fill(rect)
        
        // create uiimage
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else { return self }
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
