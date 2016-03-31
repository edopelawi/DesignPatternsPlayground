//
//  DomesticCat.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/31/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation


class DomesticCat: Feline {
    
    override func planDailyActivity() {
        
        morningActivity = [
            FelineDailyActivity.Sleep,
            FelineDailyActivity.Play,
            FelineDailyActivity.Eat,
            FelineDailyActivity.Play
        ]

        afternoonActivity = [
            FelineDailyActivity.Bored,
            FelineDailyActivity.Bath,
            FelineDailyActivity.Eat
        ]

        eveningActivity = [
            FelineDailyActivity.Eat,
            FelineDailyActivity.Bored,
            FelineDailyActivity.Play,
            FelineDailyActivity.Sleep
        ]
        
    }
}