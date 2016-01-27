//
//  Food.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/23/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum FoodType: Int {
    case Chinese = 0
    case Western = 1
    case Japanese = 2
    case Indonesian = 3
    case Others = 4
    
    /// Return total number of types.
    static func numberOfTypes() -> Int {
        return 5
    }
    
    static func stringForType(type: FoodType) -> String {

        switch type {
        case .Chinese: return "Chinese"
        case .Western: return "Western"
        case .Japanese: return "Japanese"
        case .Indonesian: return "Indonesian"
        case .Others: return "Others"
        }
    }
}

struct Food {
    internal var type: FoodType
    internal var name: String
}