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
    
    internal private(set) var burger: String?
    internal private(set) var drinks: String?
    internal private(set) var fries: String?
    internal private(set) var salad: String?
    internal private(set) var sweets: String?
    
    private let titleLimiter = "===== \n"
    
    func description() -> String {
        
        var description = ""
        
        if let burger = burger {
            description += "BURGER \n"
            description += titleLimiter
            description += burger
        }
        
        if let drinks = drinks {
            description += "DRINKS \n"
            description += titleLimiter
            description += drinks
        }
        
        if let fries = fries {
            description += "FRIES \n"
            description += titleLimiter
            description += fries
        }
        
        if let salad = salad {
            description += "SALAD \n"
            description += titleLimiter
            description += salad
        }
        
        if let sweets = sweets {
            description += "SWEETS \n"
            description += titleLimiter
            description += sweets
        }
        
        if description.isEmpty {
            description = "Empty order."
        }
        
        return description
    }
    
}
