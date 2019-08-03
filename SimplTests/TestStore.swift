//
//  TestStore.swift
//  SimplTests
//
//  Created by Maxim VT on 8/2/19.
//  Copyright © 2019 Sample. All rights reserved.
//

@testable import Simpl

class TestStore: DefaultStore {
    var didSave = false
    var didRestore = false
    
    override func save() {
        super.save()
        didSave = true
    }
    
    override func restore() {
        super.restore()
        didRestore = true
    }
}
