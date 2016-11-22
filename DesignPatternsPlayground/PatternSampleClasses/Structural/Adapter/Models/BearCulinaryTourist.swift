//
//  BearCulinaryTourist.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/14/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class BearCulinaryTourist {
    
    typealias BearActionClosure = (AnimalCulinaryTourDialogue) -> (Void)
    
    internal var tourGuide: AnimalCulinaryTourGuide?
    fileprivate let bearName = "Rotana(🐻)"
    
    /// Requests food to this instance's `tourGuide`. Returns `AnimalCulinaryTourDialogue` to passed `closure`.
    internal func requestFood(_ closure: @escaping BearActionClosure) {
        
        guard let validGuide = tourGuide else {
            closure(noTourGuideDialogue())
            return
        }
        
        validGuide.requestFood {
            [weak self] baseDialogue in

            var dialogue = baseDialogue
            dialogue.touristDialogue = "I am hungry... can we get something to eat?"
            
            if let strongSelf = self {
                dialogue.touristName = strongSelf.bearName
            } else {
                dialogue.touristName = "Bear(🐻)"
            }
            
            closure(dialogue)
        }
    }
    
    /// Requests drink to this instance's `tourGuide`. Returns `AnimalCulinaryTourDialogue` to passed `closure`.
    internal func requestDrinks(_ closure: @escaping BearActionClosure) {
        guard let validGuide = tourGuide else {
            closure(noTourGuideDialogue())
            return
        }
        
        validGuide.requestDrinks {
            [weak self] baseDialogue in
            
            var dialogue = baseDialogue
            dialogue.touristDialogue = "I am thirsty... can we get something to drink?"
            
            if let strongSelf = self {
                dialogue.touristName = strongSelf.bearName
            } else {
                dialogue.touristName = "Bear(🐻)"
            }
            
            closure(dialogue)
        }
    }
    
    // MARK: Private methods
    
    fileprivate func noTourGuideDialogue() -> AnimalCulinaryTourDialogue {
        var dialogue = AnimalCulinaryTourDialogue()
        
        dialogue.touristName = bearName
        dialogue.touristDialogue = "Erm, May I have a ... wait, nobody's here :("
        
        return dialogue
    }
}
