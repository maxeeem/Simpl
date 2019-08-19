//
//  BaseAppDelegate.swift
//  Simpl
//
//  Created by Maxim VT on 8/4/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit
import os.log

/// Shared logic

class BaseAppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        os_log(.info, "didFinishLaunching")
        return true
    }
    func applicationWillResignActive(_ application: UIApplication) {
        os_log(.info, "willResignActive")
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
        os_log(.info, "didBecomeActive")
    }
}
