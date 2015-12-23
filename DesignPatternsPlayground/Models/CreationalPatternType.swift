//
//  CreationalPatternType.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/23/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum CreationaPatternType {

    case AbstractFactory
    case FactoryMethod
    case Prototype
    case Singleton
    case Builder
    case ObjectPool
    
    /// Returns number of available types for this enum
    static func numberOfTypes() -> Int {
        return 6
    }
}