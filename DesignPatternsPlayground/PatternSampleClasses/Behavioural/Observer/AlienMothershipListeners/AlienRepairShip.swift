//
//  AlienRepairShip.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/30/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class AlienRepairShip: AlienMothershipListener {
    
    private var mothershipMessage: AlienMothershipMessage? {
        didSet {
            guard let validMessage = mothershipMessage else {
                currentStatus = "Waiting for command."
                return
            }
            
            switch validMessage {
            case .Attack: currentStatus = "Patrolling for broken ships."
            case .Retreat: currentStatus = "Falling back to mother ship."
            case .StayInPosition: currentStatus = "Waiting for command."
            case .UnitsDown: currentStatus = "Moving to repair the attacked ship."
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