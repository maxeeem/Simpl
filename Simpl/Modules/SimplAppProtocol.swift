//
//  SimplAppProtocol.swift
//  Simpl
//
//  Created by Maxim VT on 8/4/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit

/// Protocol for Simpl application
@objc protocol SimplAppProtocol where Self: UIApplication {
    var window: UIWindow { get }
    
    @objc optional func didFinishLaunching(withOptions: [UIApplication.LaunchOptionsKey: Any]?)
    @objc optional func willResignActive()
    @objc optional func didBecomeActive()
}

/// Base class for Simpl application
class SimplApp: UIApplication, SimplAppProtocol {
    let window = UIWindow()
}
