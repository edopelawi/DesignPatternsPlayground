//
//  JapaneseChef.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/28/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

struct JapaneseChef: Chef {
	
	let name: String
	
    let foodNames = [
        "Genmai gohan", "Kamameshi", "Mochi",
        "Onigiri", "Ochazuke", "Zosui",
        "Katsudon", "Yakisoba", "Anpan"
    ]
    
    /// Returns `Japanese` Food with random name.
    func cook() -> Food {
        var selectedFoodName = ""
        
        if let foodName = foodNames.randomElement() {
            selectedFoodName = foodName
        }
        
        return Food(type: .japanese, name: selectedFoodName)
    }

}
