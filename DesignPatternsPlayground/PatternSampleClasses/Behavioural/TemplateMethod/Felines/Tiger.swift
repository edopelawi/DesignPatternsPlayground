//
//  Tiger.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/31/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class Tiger: Feline {
    
    override func planDailyActivity() {
        
        morningActivity = [
            FelineDailyActivity.play,
            FelineDailyActivity.play,
            FelineDailyActivity.hunt,
        ]
        
        afternoonActivity = [
            FelineDailyActivity.hunt,
            FelineDailyActivity.eat,
            FelineDailyActivity.bath
        ]
        
        eveningActivity = [
            FelineDailyActivity.bored,
            FelineDailyActivity.sleep
        ]
        
    }
    
    override func stringForFelineActivity(_ activity: FelineDailyActivity) -> String {
        switch activity {
        case .eat: return "Tear some deer meat from \(gender.possesivePronoun()) last hunt."
        case .hunt: return "Lurks on the jungle and hunt some deers."
        case .bath: return "Licks \(gender.possesivePronoun()) whole body."
        case .play: return "Jump around the trees and chase other tigers."
        default: return super.stringForFelineActivity(activity)
        }
    }
    
}
