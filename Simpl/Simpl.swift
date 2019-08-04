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
    
    func didFinishLaunching(withOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        coordinator = Coordinator(window: window, store: store)
        coordinator.launch()
    }
    
    func willResignActive() {
        store.save()
    }
    
    func didBecomeActive() {
        store.restore()
    }
}
