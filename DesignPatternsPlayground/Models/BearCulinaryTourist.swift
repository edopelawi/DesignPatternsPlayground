//
//  BearCulinaryTourist.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/14/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class BearCulinaryTourist {
    
    typealias BearActionClosure = (String) -> (Void)
    
    internal var tourGuide: AnimalCulinaryTourGuide?
    
    /// Returns retrieved `String` food, according to current `tourGuide` instance.
    internal func hungryAction(closure: BearActionClosure) {
        guard let validGuide = tourGuide else {
            closure("")
            return
        }
        
        validGuide.requestFood(closure)
    }
    
    /// Returns retrieved `String` drink, according to current `tourGuide` instance.
    internal func thirstyAction(closure: BearActionClosure) {
        guard let validGuide = tourGuide else {
            closure("")
            return
        }
        
        validGuide.requestDrinks(closure)
    }
}