//
//  main.swift
//  Simpl
//
//  Created by Maxim VT on 8/4/19.
//  Copyright © 2019 Sample. All rights reserved.
//

let isTesting: Bool = {
    #if TESTING
    return true
    #else
    return false
    #endif
}()

run(Simpl.self, testing: isTesting)
