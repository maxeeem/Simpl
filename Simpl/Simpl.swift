//
//  App.swift
//  Simpl
//
//  Created by Maxim VT on 8/2/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit
import os.log

class Simpl: SimplApp {

    var store: DataStore!
    var coordinator: Coordinator!

    // tests should set dependencies manually
    override init() {
        #if !TESTING
        store = DefaultStore()
        #endif
        super.init()
    }
}

extension Simpl {
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let result = super.application(application, didFinishLaunchingWithOptions: launchOptions)
        coordinator = Coordinator(window: window!, store: store)
        coordinator.launch()
        os_log(.info, "Coordinator launched")
        return result
    }
    
    override func applicationWillResignActive(_ application: UIApplication) {
        super.applicationWillResignActive(application)
        store.save()
    }
    
    override func applicationDidBecomeActive(_ application: UIApplication) {
        super.applicationDidBecomeActive(application)
        store.restore()
    }
}
