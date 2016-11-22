//
//  KoalaCulinaryTourGuide.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/14/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class KoalaCulinaryTourGuide: AnimalCulinaryTourGuide {
    
    fileprivate var chef: KoalaChef
 
    init(chef: KoalaChef) {
        self.chef = chef
    }
    
    func requestFood(_ closure: AnimalCulinaryRequestClosure) {
        
        var dialogue = basicDialogue()
        
        dialogue.tourGuideDialogue = "Heerp, may I have a dish for my guest, heeerp?"
        dialogue.tourChefDialogue = chef.eucalyptusLeaves()
        
        closure(dialogue)
    }
    
    func requestDrinks(_ closure: AnimalCulinaryRequestClosure) {
        
        var dialogue = basicDialogue()
        
        dialogue.tourGuideDialogue = "Heerp, may I have a drink for my guest, heerp?"
        dialogue.tourChefDialogue = chef.eucalyptusOil()
        
        closure(dialogue)
    }
    
    // MARK: Private methods
    
    fileprivate func basicDialogue() -> AnimalCulinaryTourDialogue {
        var dialogue = AnimalCulinaryTourDialogue()
        
        dialogue.tourGuideName = "Yabbra(🐨)"
        dialogue.tourChefName = "Goonaroo(🐨🌿)"
        
        return dialogue
    }
}
