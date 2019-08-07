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
func run<A,B>(_ appClass: A.Type, _ delegateClass: B.Type) where A: SimplAppProtocol, B: UIResponder & UIApplicationDelegate {
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
/// Uses default SimplAppDelegate
///
/// - Parameters:
///   - appClass: Main App class
func run<A>(_ appClass: A.Type) where A: SimplAppProtocol {
    UIApplicationMain(
        CommandLine.argc,
        CommandLine.unsafeArgv,
        // app class
        NSStringFromClass(appClass),
        // app delegate
        NSStringFromClass(SimplAppDelegate<A>.self)
    )
}

/// Creates and launches UIApplicationMain
/// Sets AppDelegate to nil for testing
///
/// - Parameter appClass: Main App class
func test<A>(_ appClass: A.Type) where A: SimplAppProtocol {
    UIApplicationMain(
        CommandLine.argc,
        CommandLine.unsafeArgv,
        // app class & app delegate (nil)
        NSStringFromClass(appClass), nil
    )
}
