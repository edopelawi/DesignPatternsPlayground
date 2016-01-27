//
//  CreationalPatternType.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/23/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum CreationalPatternType: Int, PatternType {

    case AbstractFactory = 0
    case FactoryMethod = 1
    case Builder = 2
    case Prototype = 3
    case Singleton = 4
    
    static func numberOfTypes() -> Int {
        return 5
    }
    
    func toString() -> String {
        
        switch self {
            
        case .AbstractFactory: return "Abstract Factory"
        case .FactoryMethod: return "Factory Method"
        case .Builder: return "Builder"
        case .Prototype: return "Prototype"
        case .Singleton: return "Singleton"
        }
    }
}