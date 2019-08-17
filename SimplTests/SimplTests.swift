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
    
    var simpl: Simpl { return UIApplication.shared as! Simpl }
    
    let testStore = TestStore()

    override func setUp() {
        super.setUp()
        // Inject Test data store
        simpl.store = testStore
    }

    func testSimplApp() {
        // Test app calling `save` when resigning active
        XCTAssertFalse(testStore.didSave)
        simpl.applicationWillResignActive(simpl)
        XCTAssertTrue(testStore.didSave)
        
        // Test app calling `restore` after becoming active
        XCTAssertFalse(testStore.didRestore)
        simpl.applicationDidBecomeActive(.shared)
        XCTAssertTrue(testStore.didRestore)
    }

    func testAppWindow() {
        XCTAssertNil(simpl.window) // should start out without a window
        
        // Test app delegate method
        simpl.delegate = simpl
        let result = simpl.application(.shared, didFinishLaunchingWithOptions: nil)
        XCTAssertTrue(result)
        XCTAssertNotNil(simpl.window)
    }

    func testCoordinator() {
        let window = UIWindow()
        let testStore = TestStore()
        let coordinator = Coordinator(window: window, store: testStore)
        
        // Test coordinator launch method
        XCTAssertNil(window.rootViewController)
        coordinator.launch()
        XCTAssertNotNil(window.rootViewController)
        
        // Verify view controller hierarchy
        let navigation = window.rootViewController as? UINavigationController
        let viewController = navigation?.viewControllers.first as? ViewController
        XCTAssertNotNil(navigation)
        XCTAssertNotNil(viewController)
    }
    
    func testViewController() {
        let testStore = TestStore()
        let viewController = ViewController(store: testStore)
        
        // Test view controller method
        XCTAssertNil(viewController.title)
        viewController.viewDidLoad()
        XCTAssertEqual(viewController.title, "Simpl")
    }
    
}
