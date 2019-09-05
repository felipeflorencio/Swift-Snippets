//
//  ApplicationDelegate+Helpers.swift
//
//  Created by Felipe Florencio Garcia on 17/07/18.
//  Copyright © 2018 Felipe Garcia. All rights reserved.
//

import Foundation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        setInitialViewController()

        return true
    }
}

extension AppDelegate {
    
    // This is a way for you set the initial view controller programmatically, it's just a example
    // one of the things that you can do is have some logic that change according to your need
    // the `secret` is the variable `window?.rootViewController`.
    // It's important call this method before the method `didFinishLaunchingWithOptions` return true
    func setInitialViewController() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let initialViewController = storyboard.instantiateInitialViewController() as? UIViewController else {
            fatalError("No initial view controller set")
        }
        
        window?.rootViewController = initialViewController
    }
}
