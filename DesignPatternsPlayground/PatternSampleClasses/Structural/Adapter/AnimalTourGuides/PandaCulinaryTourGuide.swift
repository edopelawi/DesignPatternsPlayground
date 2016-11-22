//
//  PandaCulinaryTourGuide.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/14/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class PandaCulinaryTourGuide: AnimalCulinaryTourGuide {
    
    fileprivate var chef: PandaChef
    
    init(chef: PandaChef) {
        self.chef = chef
    }
    
    func requestDrinks(_ closure: AnimalCulinaryRequestClosure) {
        
        var dialogue = basicDialogue()
        
        dialogue.tourGuideDialogue = "Chef, may I have a drink for my guest? *munches*"
        dialogue.tourChefDialogue = getDrinkFromChef()
        
        closure(dialogue)
    }
    
    func requestFood(_ closure: AnimalCulinaryRequestClosure) {
        
        var dialogue = basicDialogue()
        
        dialogue.tourGuideDialogue = "Chef, may I have a dish for my guest? *munches*"
        dialogue.tourChefDialogue = chef.bambooLeaves()
        
        closure(dialogue)
    }    
    
    // MARK: Private methods
    
    fileprivate func basicDialogue() -> AnimalCulinaryTourDialogue {
        var dialogue = AnimalCulinaryTourDialogue()

        dialogue.tourGuideName = "Tian Tian(🐼)"
        dialogue.tourChefName = "Yang Guang(🐼🎋)"
        
        return dialogue
    }
    
    fileprivate func getDrinkFromChef() -> String {
        var beverageType: PandaBeverage
        
        let randomInt = arc4random() % 2
        
        if randomInt > 0 {
            beverageType = .beer
        } else {
            beverageType = .greenTea
        }
        
        return chef.beverage(beverageType)
    }
}
