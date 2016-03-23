//
//  BehaviouralPatternType.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/23/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum BehaviouralPatternType: Int, PatternType {
    
    case ChainOfResponsibility = 0
    case Command = 1
    case Intrepreter = 2
    case Iterator = 3
    case Mediator = 4
    case Memento = 5
    case Observer = 6
    case State = 7
    case Strategy = 8
    case TemplateMethod = 9
    
    static func numberOfTypes() -> Int {
        return 10
    }
    
    func toString() -> String {
        
        switch self {
        case .ChainOfResponsibility: return "Chain of Responsibility"
        case .Command: return "Command"
        case .Intrepreter: return "Intrepreter"
        case .Iterator: return "Iterator"
        case .Mediator: return "Mediator"
        case .Memento: return "Memento"
        case .Observer: return "Observer"
        case .State: return "State"
        case .Strategy: return "Strategy"
        case .TemplateMethod: return "Template Method"
        }
    }
}