//
//  Coordinator.swift
//  Simpl
//
//  Created by Maxim VT on 8/3/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit

class Coordinator {
    let window: UIWindow
    let store: DataStore
    
    init(window: UIWindow, store: DataStore) {
        self.window = window
        self.store = store
    }
    
    func launch() {
        window.rootViewController = {
            let viewController = ViewController(store: store)
            return UINavigationController(rootViewController: viewController)
        }()
        window.makeKeyAndVisible()
    }
}
