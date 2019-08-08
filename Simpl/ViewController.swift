//
//  ViewController.swift
//  Simpl
//
//  Created by Maxim VT on 8/2/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    weak var coordinator: Coordinator?
    
    let store: DataStore
    
    init(store: DataStore) {
        self.store = store
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { return nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Simpl"
    }
}
