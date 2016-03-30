//
//  AlienAttackerShip.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/30/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class AlienAttackerShip: AlienMothershipListener {
    
    private var mothershipMessage: AlienMothershipMessage? {
        didSet {
            
            guard let validMessage = mothershipMessage else {
                currentStatus = "Waiting for command."
                return
            }
            
            switch validMessage {

            case .Attack: currentStatus = "Commencing attack procedure."
            case .Retreat: currentStatus = "Falling back to mother ship."
            case .StayInPosition: currentStatus = "Waiting for command."
            case .UnitsDown: break
                
            }                        
        }
    }
    
    private var currentStatus = "Waiting for command."
    
    func handleMothershipMessage(message: AlienMothershipMessage) {
        mothershipMessage = message
    }
    
    func shipCurrentStatus() -> String {
        return currentStatus
    }
}
