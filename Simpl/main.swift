//
//  main.swift
//  Simpl
//
//  Created by Maxim VT on 8/2/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit

let app = NSStringFromClass(Simpl.self)

#if TESTING
let appDelegate: String? = nil
#else
let appDelegate = NSStringFromClass(SimplDelegate.self)
#endif

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, app, appDelegate)
