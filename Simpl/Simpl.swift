//
//  App.swift
//  Simpl
//
//  Created by Maxim VT on 8/2/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit

class Simpl: UIApplication {
    private let window = UIWindow()

    private var coordinator: Coordinator!

    internal var store: DataStore!
    
    override init() {
        // tests can override properties
        if !TESTING {
            store = DefaultStore()
        }
        super.init()
    }

    func didFinishLaunching() {
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
