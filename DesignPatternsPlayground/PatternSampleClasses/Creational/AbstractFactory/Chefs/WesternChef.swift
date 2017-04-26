//
//  WesternChef.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/28/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

struct WesternChef: Chef {

	let name: String
	
    let foodNames = [
        "Carbonade flamande", "Slavink", "Guotie",
        "Mille-feuille", "Gromperekichelcher", "Kalberwurst",
        "Griebenschmalz", "Braunkohl", "Braunschweiger"
    ]
    
    /// Returns `Western` Food with random name.
    func cook() -> Food {
        var selectedFoodName = ""
        
        if let foodName = foodNames.randomElement() {
            selectedFoodName = foodName
        }
        
        return Food(type: .western, name: selectedFoodName)
    }

}
