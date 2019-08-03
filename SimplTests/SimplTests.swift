//
//  SimplTests.swift
//  SimplTests
//
//  Created by Maxim VT on 8/2/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import XCTest
@testable import Simpl

class SimplTests: XCTestCase {

    func testSimplAppDelegate() {
        let appDelegate = SimplDelegate()
        XCTAssertNil(appDelegate.simpl) // should not have a reference to application
        
        let simpl = UIApplication.shared as! Simpl
        XCTAssertNil(simpl.delegate) // should start out without delegate in testing
        
        XCTAssertNil(simpl.store) // should not have a store initially
        let store = TestStore()
        simpl.store = store

        // Test app delegate lifecycle
        
        let result = appDelegate.application(simpl, didFinishLaunchingWithOptions: nil)
        XCTAssertTrue(result)
        
        XCTAssertEqual(appDelegate.simpl, simpl) // should reference the same application

        // Test app delegate calling save when resigning active
        
        XCTAssertFalse(store.didSave)
        appDelegate.applicationWillResignActive(simpl)
        XCTAssertTrue(store.didSave)
        
        // Test app delegate calling restore after becoming active
        
        XCTAssertFalse(store.didRestore)
        appDelegate.applicationDidBecomeActive(simpl)
        XCTAssertTrue(store.didRestore)
    }

    func testViewController() {
        let store = TestStore()
        let vc = ViewController(store: store)
        
        XCTAssertNil(vc.title)
        vc.viewDidLoad()
        XCTAssertEqual(vc.title, "Simpl")
    }
}
