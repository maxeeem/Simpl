//
//  main.swift
//  Simpl
//
//  Created by Maxim VT on 8/4/19.
//  Copyright © 2019 Sample. All rights reserved.
//
import UIKit
#if TESTING // launches app with nil AppDelegate
UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, nil)
#else
UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(AppDelegate.self))
#endif
