//
//  ChineseChef.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/23/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class ChineseChef: Chef {
    
    let foodNames = [
        "Baozi", "Dim Sum", "Guotie",
        "Jiaozi", "Mantou", "Wonton",
        "Xiaolongbao", "Shaobing", "Yuotiao"
    ]
    
    /// Returns `Chinese` Food with random name.
    func cook() -> Food {
        let foodNamesCount = foodNames.count
        let selectedFoodIndex = Int(arc4random_uniform(UInt32(foodNamesCount)))
        let selectedFoodName = foodNames[selectedFoodIndex]
        
        return Food(type: .Chinese, name: selectedFoodName)
    }
}
