//
//  main.swift
//  Simpl
//
//  Created by Maxim VT on 8/2/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit

/// Creates and launches UIApplicationMain
/// Uses custom AppDelegate
///
/// - Parameters:
///   - appClass: Main App class
///   - delegate: AppDelegate class
func run<A,B>(_ appClass: A.Type, _ delegateClass: B.Type) where A: UIApplication, B: UIApplicationDelegate {
    UIApplicationMain(
        CommandLine.argc,
        CommandLine.unsafeArgv,
        // app class
        NSStringFromClass(appClass),
        // app delegate
        NSStringFromClass(delegateClass)
    )
}

/// Creates and launches UIApplicationMain
/// Uses app object for delegate
///
/// - Parameters:
///   - appClass: Main App class
func run<A>(_ appClass: A.Type) where A: UIApplication & UIApplicationDelegate {
    run(appClass, appClass)
}

/// Creates and launches UIApplicationMain
/// Uses SimplDelegate
///
/// - Parameter appClass: Main App class
func test<A>(_ appClass: A.Type) where A: UIApplication {
    run(appClass, SimplDelegate.self)
}
