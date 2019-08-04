//
//  main.swift
//  Simpl
//
//  Created by Maxim VT on 8/2/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit

/// Creates and launches UIApplicationMain
///
/// - Parameters:
///   - appClass: Main App class
///   - testing: Sets AppDelegate to nil for testing
func run<A>(_ appClass: A.Type, testing: Bool) where A: SimplAppProtocol {
    UIApplicationMain(
        CommandLine.argc,
        CommandLine.unsafeArgv,
        // app class
        NSStringFromClass(appClass),
        // app delegate
        testing ? nil : NSStringFromClass(SimplAppDelegate<A>.self)
    )
}
