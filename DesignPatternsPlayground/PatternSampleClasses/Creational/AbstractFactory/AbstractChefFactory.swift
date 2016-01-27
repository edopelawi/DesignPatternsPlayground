//
//  AbstractChefFactory.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/28/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class AbstractChefFactory {
    
    /// Returns appropriate `Chef`
    class func chefForFoodType(type: FoodType) -> Chef {
        
        switch type {

        case .Chinese: return ChineseChef()
        case .Western: return WesternChef()
        case .Japanese: return JapaneseChef()
        case .Indonesian: return IndonesianChef()
        case .Others: return OtherCuisineChef()
        }
    }
}