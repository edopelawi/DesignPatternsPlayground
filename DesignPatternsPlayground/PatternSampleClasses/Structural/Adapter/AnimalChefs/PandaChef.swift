//
//  PandaChef.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/14/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum PandaBeverage {
    case GreenTea
    case Beer
}

class PandaChef {
    
    func bambooLeaves() -> String {
        return "Bambo Leaves! 🎋 If you're lucky, you'll find money in the red envelope!"
    }
    
    func beverage(type: PandaBeverage) -> String {
        switch type {
        case .GreenTea: return "Green Tea! 🍵 Good drink after you finished eating, extra health for you!"
        case .Beer: return "Beer! 🍺 This one's a secret recipe from Mangix, the legendary brewmaster!"
        }
    }
    
}