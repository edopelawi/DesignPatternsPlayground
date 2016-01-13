//
//  StructuralPatternType.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/13/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum StructuralPatternType: Int, PatternType {
    
    case Adapter = 0
    case Bridge = 1
    case Composite = 2
    case Decorator = 3
    case Facade = 4
    case Flyweight = 5
    case Proxy = 6
    
    static func numberOfTypes() -> Int {
        return 7
    }
    
    func toString() -> String {
        switch self {
        case .Adapter: return "Adapter"
        case .Bridge: return "Bridge"
        case .Composite: return "Composite"
        case . Decorator: return "Decorator"
        case .Facade: return "Facade"
        case .Flyweight: return "Flyweight"
        case .Proxy: return "Proxy"
        }
    }
    
}