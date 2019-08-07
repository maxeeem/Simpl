//
//  App.swift
//  Simpl
//
//  Created by Maxim VT on 8/2/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit

class Simpl: SimplApp {
    
    var store: DataStore!
    var coordinator: Coordinator!

    override init() {
        // tests should set these properties manually
        #if !TESTING
        store = DefaultStore()
        #endif
        super.init()
    }
    
    override func didFinishLaunching(withOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        super.didFinishLaunching(withOptions: launchOptions)
        coordinator = Coordinator(window: window, store: store)
        coordinator.launch()
    }
    
    override func willResignActive() {
        super.willResignActive()
        store.save()
    }
    
    override func didBecomeActive() {
        super.didBecomeActive()
        store.restore()
    }
}
