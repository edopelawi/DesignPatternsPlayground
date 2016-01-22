//
//  FightingMoves.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/22/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

protocol FightingMoves {
    
    /// Returns `String` representation of this instance's punch move.
    func punch() -> String
    
    /// Returns `String` representation of this instance's kick move.
    func kick() -> String
}