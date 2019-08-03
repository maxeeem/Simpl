//
//  AppDelegate.swift
//  Simpl
//
//  Created by Maxim VT on 8/2/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit

class SimplDelegate: UIResponder, UIApplicationDelegate {
    weak var simpl: Simpl! // weak reference to application

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        simpl = (application as! Simpl)
        simpl.didFinishLaunchingWithOptions()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        simpl.store.save()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        simpl.store.restore()
    }
}

