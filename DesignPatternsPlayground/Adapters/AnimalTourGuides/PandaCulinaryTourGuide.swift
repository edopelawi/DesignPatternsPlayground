//
//  PandaCulinaryTourGuide.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/14/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class PandaCulinaryTourGuide: AnimalCulinaryTourGuide {
    
    private var chef: PandaChef
    
    init(chef: PandaChef) {
        self.chef = chef
    }
    
    func requestDrinks(closure: AnimalCulinaryRequestClosure) {
        
        var beverageType: PandaBeverage
        
        let randomInt = random() % 2
        
        if randomInt > 0 {
            beverageType = .Beer
        } else {
            beverageType = .GreenTea
        }
        
        let drinks = chef.beverage(beverageType)
        closure(drinks)
    }
    
    func requestFood(closure: AnimalCulinaryRequestClosure) {
        closure(chef.bambooLeaves())
    }
}