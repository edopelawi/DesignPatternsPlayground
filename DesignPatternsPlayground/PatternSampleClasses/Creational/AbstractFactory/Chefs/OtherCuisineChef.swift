//
//  OtherCuisineChef.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/28/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

struct OtherCuisineChef: Chef {
 
	let name: String
	
    let foodNames = [
        "Dry-Roasted Peanuts & Pork",
        "Oven-Grilled Blackberry & Ginger Shrimps",
        "Cooked Honey-Coated Taco",
        "Cocoa Gingerbread",
        "Lime and Mango Cake",
        "Simmered Sweet & Savory Chestnuts",
        "Barbecued Mustard & Thyme Mutton",
        "Basted Mint Prawns",
        "Melon Bread"
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