//
//  MonkeyCulinaryTourGuide.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/14/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class MonkeyCulinaryTourGuide: AnimalCulinaryTourGuide {
    
    private var chef: MonkeyChef
    
    init(chef: MonkeyChef) {
        self.chef = chef
    }
    
    func requestDrinks(closure: AnimalCulinaryRequestClosure) {
        closure(chef.tropicalJuice())
    }
    
    func requestFood(closure: AnimalCulinaryRequestClosure) {
        
        let randomInt = random() % 2
        
        var food = ""
        
        if randomInt > 0 {
            food = chef.apple()
        } else {
            food = chef.banana()
        }
        
        closure(food)
    }
}