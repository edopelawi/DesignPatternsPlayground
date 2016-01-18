//
//  AnimalCulinaryTourGuide.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/14/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

typealias AnimalCulinaryRequestClosure = (String) -> (Void)

protocol AnimalCulinaryTourGuide {
    
    /// Emoji that used as this tour guide's icon.
    var tourGuideIcon: String { get }
    
    /// Emoji that used as the chef's icon that currently handled by this tour guide.
    var culinaryChefIcon: String { get }
    
    /// Request drinks for this animal culinary spot. Will return `String` through
    /// passed `closure`.
    func requestDrinks(closure: AnimalCulinaryRequestClosure)

    /// Request food for this animal culinary spot. Will return `String` through
    /// passed `closure`.
    func requestFood(closure: AnimalCulinaryRequestClosure)
    
}