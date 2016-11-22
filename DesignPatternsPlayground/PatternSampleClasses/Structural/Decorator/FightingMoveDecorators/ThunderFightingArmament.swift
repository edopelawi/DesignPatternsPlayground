//
//  ThunderFightingArmament.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/22/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class ThunderFightingArmament: FightingMoves {
    
    /// In a sense, an object that implements `FightingMoves` could be called as a `fighter`, no?
    fileprivate var fighter: FightingMoves
    
    init(fighter: FightingMoves) {
        self.fighter = fighter
    }
    
    func punch() -> String {
        return "⚡️\(fighter.punch())⚡️"
    }
    
    func kick() -> String {
        return "⚡️\(fighter.kick())⚡️"
    }
}
