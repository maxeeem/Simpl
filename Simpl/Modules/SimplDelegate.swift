//
//  SimplDelegate.swift
//  Simpl
//
//  Created by Maxim VT on 8/17/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit

/// AppDelegate used in testing
/// Prevents delegate methods firing on main app

class SimplDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}
