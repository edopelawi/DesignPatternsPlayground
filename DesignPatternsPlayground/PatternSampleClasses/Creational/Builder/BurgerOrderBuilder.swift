//
//  BurgerOrderBuilder.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/30/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

protocol BurgerOrderBuilder {
    
    func addBurger() -> BurgerOrderBuilder
    func addDrinks() -> BurgerOrderBuilder
    func addFries() -> BurgerOrderBuilder
    func addSalad() -> BurgerOrderBuilder
    func addSweets() -> BurgerOrderBuilder
    
    /// Returns `BurgerOrder` instance that corresponds this instance's method calls.
    func makeOrder() -> BurgerOrder
}