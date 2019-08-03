//
//  App.swift
//  Simpl
//
//  Created by Maxim VT on 8/2/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit

class Simpl: UIApplication {
    let window = UIWindow()

    var store: DataStore!
    
    override init() {
        // tests can override properties
        if !TESTING {
            store = DefaultStore()
        }
        super.init()
    }

    func didFinishLaunchingWithOptions() {
        window.rootViewController = {
            let viewController = ViewController(store: store)
            return UINavigationController(rootViewController: viewController)
        }()
        window.makeKeyAndVisible()
    }
    
    func willResignActive() {
        store.save()
    }
    
    func didBecomeActive() {
        store.restore()
    }
}
