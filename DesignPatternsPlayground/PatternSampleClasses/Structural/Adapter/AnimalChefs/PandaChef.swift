//
//  PandaChef.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/14/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum PandaBeverage {
    case greenTea
    case beer
}

class PandaChef {
    
    func bambooLeaves() -> String {
        return "Bambo Leaves! 🎋 If you're lucky, you'll find money in the red envelope!"
    }
    
    func beverage(_ type: PandaBeverage) -> String {
        switch type {
        case .greenTea: return "Green Tea! 🍵 Good drink after you finished eating, extra health for you!"
        case .beer: return "Beer! 🍺 This one's a secret recipe from Mangix, the legendary brewmaster!"
        }
    }
    
}
