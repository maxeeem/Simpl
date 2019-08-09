//
//  SimplAppProtocol.swift
//  Simpl
//
//  Created by Maxim VT on 8/4/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit
import os.log

/// Protocol for Simpl application
protocol SimplAppProtocol: class {
    var window: UIWindow { get }
    
    func didFinishLaunching(withOptions: [UIApplication.LaunchOptionsKey: Any]?)
    func willResignActive()
    func didBecomeActive()
}

/// Base class for Simpl application
class SimplApp: UIApplication, SimplAppProtocol {
    lazy var window = UIWindow()
    
    func didFinishLaunching(withOptions: [UIApplication.LaunchOptionsKey : Any]?) {
        os_log(.info, "didFinishLaunching")
    }
    func willResignActive() {
        os_log(.info, "willResignActive")
    }
    func didBecomeActive() {
        os_log(.info, "didBecomeActive")
    }
}
