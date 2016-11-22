//
//  CatCulinaryTourGuide.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/14/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class CatCulinaryTourGuide: AnimalCulinaryTourGuide {
    
    fileprivate var chef: CatChef
    
    init(chef: CatChef) {
        self.chef = chef
    }
    
    func requestDrinks(_ closure: AnimalCulinaryRequestClosure) {
        var dialogue = basicDialogue()
        
        dialogue.tourGuideDialogue = "May I have a drink for my guest, meow?"
        dialogue.tourChefDialogue = chef.catMilk()
        
        closure(dialogue)
    }
    
    func requestFood(_ closure: AnimalCulinaryRequestClosure) {

        var dialogue = basicDialogue()
        dialogue.tourGuideDialogue = "May I have a dish for my guest, meow meow?"
        dialogue.tourChefDialogue = getFoodFromChef()
        
        closure(dialogue)
    }
    
    // MARK: Private methods
    
    fileprivate func  basicDialogue() -> AnimalCulinaryTourDialogue {
        var dialogue = AnimalCulinaryTourDialogue()
        dialogue.tourGuideName = "Miao(😸)"
        dialogue.tourChefName = "Kato(🐱🍼)"
        return dialogue
    }
    
    fileprivate func getFoodFromChef() -> String {
        
        let randomNumber = arc4random() % 2
        
        if randomNumber > 0 {
            return chef.grilledHamster()
        } else {
            return chef.roastedMice()
        }
    }
}
