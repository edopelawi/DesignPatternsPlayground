//
//  CreationalPatternType.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/23/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum CreationaPatternType: Int, PatternType {

    case AbstractFactory = 0
    case FactoryMethod = 1
    case Builder = 2
    case ObjectPool = 3
    case Prototype = 4
    case Singleton = 5
    
    static func numberOfTypes() -> Int {
        return 6
    }
}