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

    func testSimplApp() {
        let simpl = UIApplication.shared as! Simpl
    
        // Inject Test data store
        XCTAssertNil(simpl.store)
        let testStore = TestStore()
        simpl.store = testStore
        
        // Test app calling `save` when resigning active
        XCTAssertFalse(testStore.didSave)
        simpl.willResignActive()
        XCTAssertTrue(testStore.didSave)
        
        // Test app calling `restore` after becoming active
        XCTAssertFalse(testStore.didRestore)
        simpl.didBecomeActive()
        XCTAssertTrue(testStore.didRestore)
    }

    func testSimplDelegate() {
        let simpl = UIApplication.shared as! Simpl
        XCTAssertNil(simpl.delegate) // app should start without delegate in testing

        let appDelegate = SimplAppDelegate<Simpl>()
        XCTAssertNil(appDelegate.app) // should not have a reference to application
        
        // Test app delegate method
        let result = appDelegate.application(simpl, didFinishLaunchingWithOptions: nil)
        XCTAssertTrue(result)
        
        XCTAssertEqual(appDelegate.app, simpl) // should reference the same application
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
