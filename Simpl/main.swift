//
//  main.swift
//  Simpl
//
//  Created by Maxim VT on 8/2/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit

// Launch argument passed during Testing
let TESTING = ProcessInfo.processInfo.arguments.contains("isTesting")

UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    // app class
    NSStringFromClass(Simpl.self),
    // app delegate
    TESTING ? nil : NSStringFromClass(SimplDelegate.self)
)
