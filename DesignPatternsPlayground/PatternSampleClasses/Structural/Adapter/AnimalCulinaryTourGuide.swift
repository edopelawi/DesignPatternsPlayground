//
//  AnimalCulinaryTourGuide.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/14/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

typealias AnimalCulinaryRequestClosure = (AnimalCulinaryTourDialogue) -> (Void)

protocol AnimalCulinaryTourGuide {
    
    /// Request drinks for this animal culinary spot. Will return `AnimalCulinaryTourDialogue` through
    /// passed `closure`.
    func requestDrinks(_ closure: AnimalCulinaryRequestClosure)

    /// Request food for this animal culinary spot. Will return `AnimalCulinaryTourDialogue` through
    /// passed `closure`.
    func requestFood(_ closure: AnimalCulinaryRequestClosure)
    
}
