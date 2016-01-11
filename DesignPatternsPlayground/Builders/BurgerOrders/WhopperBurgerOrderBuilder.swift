//
//  WhopperBurgerOrderBuilder.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/30/15.
//  Copyright (c) 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class WhopperBurgerOrderBuilder: BurgerOrderBuilder {
    
    private var burger = ""
    private var drinks = ""
    private var fries = ""
    private var salad = ""
    private var sweets = ""
    
    func addBurger() -> BurgerOrderBuilder {
        burger = "WHOPPER™ Sandwich"
        return self
    }
    
    func addDrinks() -> BurgerOrderBuilder {
        drinks = "WHOPPER™ Extra Cola"
        return self
    }
    
    func addFries() -> BurgerOrderBuilder {
        fries = "Large French Fries"
        return self
    }
    
    func addSalad() -> BurgerOrderBuilder {
        salad = "Bacon Cheddar Ranch Chicken Salad"
        return self
    }
    
    func addSweets() -> BurgerOrderBuilder {
        sweets = "Red Velvet OREO Shake"
        return self
    }
    
    func makeOrder() -> BurgerOrder {
        return BurgerOrder(
            burger: burger,
            drinks: drinks,
            fries: fries,
            salad: salad,
            sweets: sweets
        )
    }
}