//
//  ChineseChef.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/23/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

struct ChineseChef: Chef {
	
	let name: String
	
    let foodNames = [
        "Baozi", "Dim Sum", "Guotie",
        "Jiaozi", "Mantou", "Wonton",
        "Xiaolongbao", "Shaobing", "Yuotiao"
    ]
	
    /// Returns `Chinese` Food with random name.
    func cook() -> Food {
        var selectedFoodName = ""
        
        if let foodName = foodNames.randomElement() {
            selectedFoodName = foodName
        }
        
        return Food(type: .Chinese, name: selectedFoodName)
    }
}
