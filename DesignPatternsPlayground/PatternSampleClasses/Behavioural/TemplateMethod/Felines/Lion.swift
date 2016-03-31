//
//  Lion.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/31/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class Lion: Feline {
    
    override func planDailyActivity() {
        
        morningActivity = [
            FelineDailyActivity.Hunt,
            FelineDailyActivity.Hunt,
            FelineDailyActivity.Eat,
        ]
        
        afternoonActivity = [
            FelineDailyActivity.Play,
            FelineDailyActivity.Play,
            FelineDailyActivity.Bath
        ]
        
        eveningActivity = [
            FelineDailyActivity.Bored,
            FelineDailyActivity.Sleep
        ]
        
    }
    
    override func stringForFelineActivity(activity: FelineDailyActivity) -> String {
        switch activity {
        case .Eat: return "Chew the giraffe from \(gender.possesivePronoun()) last hunt."
        case .Hunt: return "Lurks on the savannah and hunt some giraffes."
        case .Bath: return "Licks \(gender.possesivePronoun()) whole body"
        case .Play: return "Play hunter and hunted with other Lions."            
        default: return super.stringForFelineActivity(activity)
        }
    }
    
}