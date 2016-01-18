//
//  KoalaCulinaryTourGuide.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/14/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class KoalaCulinaryTourGuide: AnimalCulinaryTourGuide {
    
    var tourGuideIcon: String {
        return "🐨"
    }
    
    var culinaryChefIcon: String {
        return "🐨🌿"
    }
    
    private var chef: KoalaChef
 
    init(chef: KoalaChef) {
        self.chef = chef
    }
    
    func requestFood(closure: AnimalCulinaryRequestClosure) {
        closure(chef.eucalyptusLeaves())
    }
    
    func requestDrinks(closure: AnimalCulinaryRequestClosure) {
        closure(chef.eucalyptusOil())
    }
}