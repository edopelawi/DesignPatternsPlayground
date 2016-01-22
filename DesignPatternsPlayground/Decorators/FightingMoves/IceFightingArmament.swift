//
//  IceFightingArmament.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/22/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class IceFightingArmament: FightingMoves {
    
    private var fighter: FightingMoves
    
    init(fighter: FightingMoves) {
        self.fighter = fighter
    }
    
    func punch() -> String {
        return "❄️\(fighter.punch())❄️"
    }
    
    func kick() -> String {
        return "❄️\(fighter.kick())❄️"
    }
}