//
//  JapaneseChef.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/28/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class JapaneseChef: Chef {
    
    let foodNames = [
        "Genmai gohan", "Kamameshi", "Mochi",
        "Onigiri", "Ochazuke", "Zosui",
        "Katsudon", "Yakisoba", "Anpan"
    ]
    
    /// Returns `Japanese` Food with random name.
    func cook() -> Food {
        let foodNamesCount = foodNames.count
        let selectedFoodIndex = Int(arc4random_uniform(UInt32(foodNamesCount)))
        let selectedFoodName = foodNames[selectedFoodIndex]
        
        return Food(type: .Japanese, name: selectedFoodName)
    }

}