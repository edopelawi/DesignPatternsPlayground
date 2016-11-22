//
//  MonsterInvaderFlyweightFactory.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/28/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class MonsterInvaderFlyweightFactory {
    
    fileprivate var invaderHashMap = [String: MonsterInvader]()
    
    /// Returns `MonsterInvader` instance with passed `icon`.
    internal func retrieveInvaderWithIcon(_ icon: String) -> MonsterInvader {
        
        if let invader = invaderHashMap[icon] {
            return invader
        }
        
        let newInvader = MonsterInvader()
        newInvader.icon = icon
        
        invaderHashMap[icon] = newInvader
        
        return newInvader
    }
}
