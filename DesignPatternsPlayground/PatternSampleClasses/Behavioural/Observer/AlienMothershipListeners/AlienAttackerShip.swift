//
//  AlienAttackerShip.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/30/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class AlienAttackerShip: AlienMothershipListener {
    
    fileprivate var mothershipMessage: AlienMothershipMessage? {
        didSet {
            
            guard let validMessage = mothershipMessage else {
                currentStatus = "Waiting for command."
                return
            }
            
            switch validMessage {

            case .Attack: currentStatus = "Commencing attack procedure."
            case .Retreat: currentStatus = "Falling back to mother ship."
            case .StayInPosition: currentStatus = "Waiting for command."
            case .UnitsDown: currentStatus = "Attacking while covering damaged units."
                
            }                        
        }
    }
    
    fileprivate var currentStatus = "Waiting for command."
    
    func handleMothershipMessage(_ message: AlienMothershipMessage) {
        mothershipMessage = message
    }
    
    func shipCurrentStatus() -> String {
        return currentStatus
    }
}
