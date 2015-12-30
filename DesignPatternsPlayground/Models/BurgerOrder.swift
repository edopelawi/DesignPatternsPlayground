//
//  BurgerOrder.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/30/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

// This struct has private setters for Builder pattern examples.
struct BurgerOrder {
    internal private(set) var burger: String
    internal private(set) var drinks: String
    internal private(set) var fries: String
    internal private(set) var salad: String
    internal private(set) var sweets: String
}