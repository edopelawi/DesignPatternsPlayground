//
//  BehaviouralPatternType.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/23/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum BehaviouralPatternType: Int, PatternType {
    
    case chainOfResponsibility = 0
    case command = 1
    case intrepreter = 2
    case iterator = 3
    case mediator = 4
    case memento = 5
    case observer = 6
    case state = 7
    case strategy = 8
    case templateMethod = 9
    
    static func numberOfTypes() -> Int {
        return 10
    }
    
    func toString() -> String {
        
        switch self {
        case .chainOfResponsibility: return "Chain of Responsibility"
        case .command: return "Command"
        case .intrepreter: return "Intrepreter"
        case .iterator: return "Iterator"
        case .mediator: return "Mediator"
        case .memento: return "Memento"
        case .observer: return "Observer"
        case .state: return "State"
        case .strategy: return "Strategy"
        case .templateMethod: return "Template Method"
        }
    }
}
