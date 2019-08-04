//
//  SimplAppDelegate.swift
//  Simpl
//
//  Created by Maxim VT on 8/2/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit

///
/// Generic AppDelegate for Simpl apps
///
/// Assigns `app` variable at launch and forwards system calls to the application
///
class SimplAppDelegate<A: SimplAppProtocol>: UIResponder, UIApplicationDelegate {
    var app: A! // reference to application

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        app = (application as! A)
        app.didFinishLaunching?(withOptions: launchOptions)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        app.willResignActive?()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        app.didBecomeActive?()
    }
}

