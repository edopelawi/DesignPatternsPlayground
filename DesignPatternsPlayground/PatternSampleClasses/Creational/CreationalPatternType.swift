//
//  CreationalPatternType.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/23/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum CreationalPatternType: Int, PatternType {

    case abstractFactory = 0
    case factoryMethod = 1
    case builder = 2
    case prototype = 3
    case singleton = 4
    
    static func numberOfTypes() -> Int {
        return 5
    }
    
    func toString() -> String {
        
        switch self {
            
        case .abstractFactory: return "Abstract Factory"
        case .factoryMethod: return "Factory Method"
        case .builder: return "Builder"
        case .prototype: return "Prototype"
        case .singleton: return "Singleton"
        }
    }
}
