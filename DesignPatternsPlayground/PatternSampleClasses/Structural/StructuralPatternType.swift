//
//  StructuralPatternType.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/13/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum StructuralPatternType: Int, PatternType {
    
    case adapter = 0
    case bridge = 1
    case composite = 2
    case decorator = 3
    case facade = 4
    case flyweight = 5
    case proxy = 6
    
    static func numberOfTypes() -> Int {
        return 7
    }
    
    func toString() -> String {
        switch self {
        case .adapter: return "Adapter"
        case .bridge: return "Bridge"
        case .composite: return "Composite"
        case . decorator: return "Decorator"
        case .facade: return "Facade"
        case .flyweight: return "Flyweight"
        case .proxy: return "Proxy"
        }
    }
    
}
