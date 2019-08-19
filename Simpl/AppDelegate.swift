//
//  AppDelegate.swift
//  Simpl
//
//  Created by Maxim VT on 8/2/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit
import os.log

class AppDelegate: BaseAppDelegate {
    
    private let store: DataStore
    private var coordinator: Coordinator!
    
    override init() {
        self.store = DefaultStore()
        super.init()
    }
    
    internal init(store: DataStore, coordinator: Coordinator?) {
        self.store = store
        self.coordinator = coordinator
        super.init()
    }
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let result = super.application(application, didFinishLaunchingWithOptions: launchOptions)
        window = UIWindow()
        if coordinator == nil {
            coordinator = Coordinator(window: window!, store: store)
        }
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
