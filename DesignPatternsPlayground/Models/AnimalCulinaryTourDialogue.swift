//
//  AnimalCulinaryTourDialogue.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/19/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation


struct AnimalCulinaryTourDialogue {
    
    // MARK: Names
    internal var touristName = ""
    internal var tourGuideName = ""
    internal var tourChefName = ""
    
    // MARK: Dialogues
    
    internal var touristDialogue = ""
    internal var tourGuideDialogue = ""
    internal var tourChefDialogue = ""
    
    /// Returns `String` representation of full dialogue from this instance's properties.
    internal func createFullDialogueString() -> String {
        var fullDialogue = "\(touristName): \(touristDialogue)\n"
        
        let validTourGuideDialogue = tourGuideName != "" && tourGuideDialogue != ""
        let validTourChefDialogue = tourChefName != "" && tourChefDialogue != ""
        
        if validTourGuideDialogue {
            fullDialogue += "\(tourGuideName): \(tourGuideDialogue)\n"
        }
        
        if validTourChefDialogue {
            fullDialogue += "\(tourChefName): \(tourChefDialogue)"
        }        
        
        return fullDialogue
    }
}