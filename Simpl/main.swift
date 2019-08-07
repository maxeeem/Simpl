//
//  main.swift
//  Simpl
//
//  Created by Maxim VT on 8/4/19.
//  Copyright © 2019 Sample. All rights reserved.
//

#if TESTING // launches app with nil AppDelegate
test(Simpl.self)
#else
run(Simpl.self)
#endif
