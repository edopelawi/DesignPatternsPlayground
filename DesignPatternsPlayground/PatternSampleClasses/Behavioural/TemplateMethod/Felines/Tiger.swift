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
            FelineDailyActivity.Play,
            FelineDailyActivity.Play,
            FelineDailyActivity.Hunt,
        ]
        
        afternoonActivity = [
            FelineDailyActivity.Hunt,
            FelineDailyActivity.Eat,
            FelineDailyActivity.Bath
        ]
        
        eveningActivity = [
            FelineDailyActivity.Bored,
            FelineDailyActivity.Sleep
        ]
        
    }
    
    override func stringForFelineActivity(activity: FelineDailyActivity) -> String {
        switch activity {
        case .Eat: return "Tear some deer meat from \(gender.possesivePronoun()) last hunt."
        case .Hunt: return "Lurks on the jungle and hunt some deers."
        case .Bath: return "Licks \(gender.possesivePronoun()) whole body."
        case .Play: return "Jump around the trees and chase other tigers."
        default: return super.stringForFelineActivity(activity)
        }
    }
    
}