//
//  DataStore.swift
//  Simpl
//
//  Created by Maxim VT on 8/2/19.
//  Copyright © 2019 Sample. All rights reserved.
//

/// Sample DataStore protocol
protocol DataStore {
    func save()
    func restore()
}

/// Sample DataStore implementation
class DefaultStore: DataStore {
    func save() {}
    func restore() {}
}
