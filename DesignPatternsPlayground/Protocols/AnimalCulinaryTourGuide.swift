//
//  AnimalCulinaryTourGuide.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/14/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

protocol AnimalCulinaryTourGuide {
    
    typealias CulinaryRequestClosure = ((String) -> Void)
    
    /// Request drinks for this animal culinary spot. Will return `String` through
    /// passed `closure`.
    func requestDrinks(closure: CulinaryRequestClosure)

    /// Request food for this animal culinary spot. Will return `String` through
    /// passed `closure`.
    func requestFood(closure: CulinaryRequestClosure)
    
}