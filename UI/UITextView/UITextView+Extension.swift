//
//  UITextView+Extension.swift
//
//  Created by Felipe Florencio Garcia on 15/07/18.
//  Copyright © 2018 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

extension UITextView {
    // Adjust the size of the UITextView according to the size of the text, for this
    // create your autolayout using the minimun size for the height, like 30 and
    // priority 750, and another constraint for the height with the size equal or higher
    // than 30 and priority higher than the previous one.
    // Depend of the other autolayou items would be important set the content hugging priority
    // vertical to higher like 750 to always fit the size to the text, and content compression
    // resistence vertical to 1000 to avoid be less than the text size
    //
    // If prefer, you can add this method as a helper passing the UITextView as parameter
    // for example: `func adjustAccordingToTheText(_ textView: UITextView)`.
    func adjustAccordingToTheText() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isScrollEnabled = false
        self.sizeToFit()
    }
}
