//
//  BearCulinaryTourGuide.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/20/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class BearCulinaryTourGuide: BearChef, AnimalCulinaryTourGuide {
    
    func requestDrinks(_ closure: AnimalCulinaryRequestClosure) {
        var dialogue = basicDialogue()
        dialogue.tourChefDialogue = sake()
        closure(dialogue)
    }
    
    func requestFood(_ closure: AnimalCulinaryRequestClosure) {
        var dialogue = basicDialogue()
        dialogue.tourChefDialogue = honey()
        closure(dialogue)
    }
    
    fileprivate func basicDialogue() -> AnimalCulinaryTourDialogue {
        var dialogue = AnimalCulinaryTourDialogue()
        
        dialogue.tourChefName = "Kuma(🐻🍯)"
        return dialogue
    }
}
