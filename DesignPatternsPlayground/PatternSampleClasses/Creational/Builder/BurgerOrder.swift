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
    
    internal fileprivate(set) var burger: String?
    internal fileprivate(set) var drinks: String?
    internal fileprivate(set) var fries: String?
    internal fileprivate(set) var salad: String?
    internal fileprivate(set) var sweets: String?
    
    fileprivate let titleLimiter = "===== \n"
    
    func description() -> String {
        
        var description = ""
        
        if let burger = burger, !burger.isEmpty {
            description += "\nBURGER \n"
            description += titleLimiter
            description += burger
        }
        
        if let drinks = drinks, !drinks.isEmpty {
            description += "\nDRINKS \n"
            description += titleLimiter
            description += drinks
        }
        
        if let fries = fries, !fries.isEmpty {
            description += "\nFRIES \n"
            description += titleLimiter
            description += fries
        }
        
        if let salad = salad, !salad.isEmpty {
            description += "\nSALAD \n"
            description += titleLimiter
            description += salad
        }
        
        if let sweets = sweets, !sweets.isEmpty {
            description += "\nSWEETS \n"
            description += titleLimiter
            description += sweets
        }
        
        if description.isEmpty {
            description = "Empty order."
        }
        
        return description
    }
    
}
