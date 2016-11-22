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
            FelineDailyActivity.hunt,
            FelineDailyActivity.hunt,
            FelineDailyActivity.eat,
        ]
        
        afternoonActivity = [
            FelineDailyActivity.play,
            FelineDailyActivity.play,
            FelineDailyActivity.bath
        ]
        
        eveningActivity = [
            FelineDailyActivity.bored,
            FelineDailyActivity.sleep
        ]
        
    }
    
    override func stringForFelineActivity(_ activity: FelineDailyActivity) -> String {
        switch activity {
        case .eat: return "Chew the giraffe from \(gender.possesivePronoun()) last hunt."
        case .hunt: return "Lurks on the savannah and hunt some giraffes."
        case .bath: return "Licks \(gender.possesivePronoun()) whole body."
        case .play: return "Play hunter and hunted with other Lions."            
        default: return super.stringForFelineActivity(activity)
        }
    }
    
}
