//
//  Food.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/23/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum FoodType {
    case Chinese
    case Western
    case Japanese
    case Indonesian
    case Others
}

struct Food {
    internal var type: FoodType
    internal var name: String
}