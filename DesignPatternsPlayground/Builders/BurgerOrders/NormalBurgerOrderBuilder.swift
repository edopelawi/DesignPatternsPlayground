//
//  NormalBurgerOrderBuilder.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/30/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class NormalBurgerOrderBuilder: BurgerOrderBuilder {
    
    // TODO: These properties are getting duplicated. Optimise later.
    
    private var burger = ""
    private var drinks = ""
    private var fries = ""
    private var salad = ""
    private var sweets = ""
    
    func addBurger() -> BurgerOrderBuilder {
        burger = "Normal-sized Cheeseburger"
        return self
    }
    
    func addDrinks() -> BurgerOrderBuilder {
        drinks = "Normal-sized Cola"
        return self
    }
    
    func addFries() -> BurgerOrderBuilder {
        fries = "Normal-sized Fries"
        return self
    }
    
    func addSalad() -> BurgerOrderBuilder {
        salad = "Garden Side Salad"
        return self
    }
    
    func addSweets() -> BurgerOrderBuilder {
        sweets = "Chocolate Hand Spun Shake"
        return self
    }
    
    func makeOrder() -> BurgerOrder {
        
        // TODO: This obvious method is getting duplicated, too. Optimise later.
        return BurgerOrder(
            burger: burger,
            drinks: drinks,
            fries: fries,
            salad: salad,
            sweets: sweets
        )
    }
}