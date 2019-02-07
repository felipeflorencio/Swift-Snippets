//
//  Dismiss+Helper.swift
//
//  Created by Felipe Florencio Garcia on 7/02/19.
//  Copyright © 2019 Felipe Garcia. All rights reserved.
//

import UIKit

extension UIView {
    
    // Easy add a tap gesture to be able to identify and do some action
    // Could be used to dismiss your view, without need to add the gesture
    // recognizer or anything else
    // You just need to call this from the view that you want to add the tap gesture,
    // for example if you are inside you view controller I can add on my viewDidLoad
    // Example:
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        self.view.dismissWhenTrigger { [weak self] in
    //            self?.dismiss(animated: false, completion: nil)
    //        }
    //    }
    //
    // You can notice that I added this method to UIView extension but you can change to
    // UIViewController extension and the only difference will be at: self.addGestureRecognizer(tap)
    // that need be changed to: view.addGestureRecognizer(tap)
    
    func dismissWhenTrigger(to dismiss: @escaping () -> ()) {
        
        typealias ActionHandler = () -> ()
        
        let action: ActionHandler = {
            dismiss()
        }
        
        let handling = HandleGesture(action: action)
        var handle: Int = 0
        objc_setAssociatedObject(self, &handle, handling, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: handling, action: handling.selector)
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
        
        class HandleGesture {
            
            let selector: Selector = #selector(HandleGesture.tapGestureRecognizer)
            let action: ActionHandler
            
            init(action handler: @escaping ActionHandler) {
                action = handler
            }
            
            @objc func tapGestureRecognizer() {
                action()
            }
        }
    }
}
