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
        
        var dialogue = basicDialogue()
        
        dialogue.tourGuideDialogue = "Chef, may I have a drink for my guest? *munches*"
        dialogue.tourChefDialogue = getDrinkFromChef()
        
        closure(dialogue)
    }
    
    func requestFood(closure: AnimalCulinaryRequestClosure) {
        
        var dialogue = basicDialogue()
        
        dialogue.tourGuideDialogue = "Chef, may I have a dish for my guest? *munches*"
        dialogue.tourChefDialogue = chef.bambooLeaves()
        
        closure(dialogue)
    }    
    
    // MARK: Private methods
    
    private func basicDialogue() -> AnimalCulinaryTourDialogue {
        var dialogue = AnimalCulinaryTourDialogue()

        dialogue.tourGuideName = "Tian Tian(🐼)"
        dialogue.tourChefName = "Yang Guang(🐼🎋)"
        
        return dialogue
    }
    
    private func getDrinkFromChef() -> String {
        var beverageType: PandaBeverage
        
        let randomInt = random() % 2
        
        if randomInt > 0 {
            beverageType = .Beer
        } else {
            beverageType = .GreenTea
        }
        
        return chef.beverage(beverageType)
    }
}