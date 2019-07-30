//
//  KeyboardAvoidHelper.swift
//
//  Created by Felipe Florencio Garcia on 30/07/19.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

class KeyboardAvoidHelper {

    private var plusSize: CGFloat?

    /// Easy add the view adjust when inside a scroll view
    /// when show text field will automatically adjust, just
    /// instantiate and hold the reference of your instance
    /// in your view controller.
    ///
    /// - Parameters:
    ///   - scrollView: scroll view that you use inside your view controller
    ///   - size: if you want more size between keyboard and your text field
    init(for scrollView: UIScrollView, plus size: CGFloat? = nil) {
        self.plusSize = size
        self.scrollView = scrollView
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(
            self,
            selector: #selector(self.onKeyboardShow(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        notificationCenter.addObserver(
            self,
            selector: #selector(self.onKeyboardHide(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    @objc private func onKeyboardShow(notification: Notification) {
        guard !keyboardShown else {
            return
        }

        keyboardShown = true

        if let keyboardRect = notification.keyboardEndFrame {
            let keyboardRectInScrollView = scrollView.convert(keyboardRect, from: nil)
            let scrollViewBottom = scrollView.bounds.maxY
            let keyboardTop = keyboardRectInScrollView.minY
            if scrollViewBottom > keyboardTop {
                var heightCoveredWithKeyboard = scrollViewBottom - keyboardTop
                if let size = plusSize {
                    heightCoveredWithKeyboard += size
                }
                scrollViewContentInset = scrollView.contentInset.bottom
                scrollView.contentInset.bottom = heightCoveredWithKeyboard
                scrollViewIndicatorInset = scrollView.scrollIndicatorInsets.bottom
                scrollView.scrollIndicatorInsets.bottom = heightCoveredWithKeyboard
            }
        }
    }

    @objc private func onKeyboardHide(notification: Notification) {
        keyboardShown = false
        scrollView.contentInset.bottom = scrollViewContentInset
        scrollView.scrollIndicatorInsets.bottom = scrollViewIndicatorInset
    }

    private var keyboardShown = false
    private var scrollViewContentInset: CGFloat = 0
    private var scrollViewIndicatorInset: CGFloat = 0
    private var scrollView: UIScrollView
}


private extension Notification {
    var keyboardEndFrame: CGRect? {
        let userInfo = self.userInfo
        return userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
    }
}
