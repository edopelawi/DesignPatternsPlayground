//
//  IndonesianChef.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/28/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

struct IndonesianChef: Chef {
	
	let name: String
	
    let foodNames = [
        "Ayam bakar", "Bubur ayam", "Empal gentong",
        "Daun ubi tumbuk", "Gado-gado", "Gudeg",
        "Iga penyet", "Karedok", "Ketoprak"
    ]
	
    /// Returns `Indonesian` Food with random name.
    func cook() -> Food {
        var selectedFoodName = ""
        
        if let foodName = foodNames.randomElement() {
            selectedFoodName = foodName
        }
        
        return Food(type: .Indonesian, name: selectedFoodName)
    }
}