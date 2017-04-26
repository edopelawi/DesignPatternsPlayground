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
            FelineDailyActivity.sleep,
            FelineDailyActivity.play,
            FelineDailyActivity.eat,
            FelineDailyActivity.play
        ]

        afternoonActivity = [
            FelineDailyActivity.bored,
            FelineDailyActivity.bath,
            FelineDailyActivity.eat
        ]

        eveningActivity = [
            FelineDailyActivity.eat,
            FelineDailyActivity.bored,
            FelineDailyActivity.play,
            FelineDailyActivity.sleep
        ]
        
    }
}
