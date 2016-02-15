//
//  DCRechargeableBattery.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 2/15/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class DCRechargeableBattery {
    
    internal let maximumCurrents = 100
    
    internal private(set) var voltage: Int
    private var currents = [DCCurrent]()
    
    init(voltage: Int) {
        self.voltage = voltage
    }
    
    /// Returns array of `DCCurrent`s regarding with requested `numberOfCurrents`.
    /// If there's not enough current available, it will return the remaining
    /// `DCCurrent`s.
    internal func retrieveCurrents(numberOfCurrents: Int) -> [DCCurrent] {
        
        var passedCurrents = [DCCurrent]()
        var remainingCurrents = [DCCurrent]()
        
        if numberOfCurrents > currents.count {
            
            passedCurrents = currents
            remainingCurrents = []
            
        } else {
        
            passedCurrents = Array( currents[0 ..< numberOfCurrents] )
            remainingCurrents = Array( currents[numberOfCurrents ..< currents.count] )
        
        }
        
        currents = remainingCurrents
        return passedCurrents
    }
    
    /// Recharge this battery with passed `numberOfCurrents`. It wont charge battery past its `maximumCurrents`.
    internal func rechargeCurrents(numberOfCurrents: Int) {
        
        var generatedCurrentsCount = 0
        
        if numberOfCurrents + currents.count > maximumCurrents {
            generatedCurrentsCount = maximumCurrents - currents.count
        } else {
            generatedCurrentsCount = numberOfCurrents
        }
        
        for _ in 0 ..< generatedCurrentsCount  {
            let newCurrent = DCCurrent(voltage: voltage)
            currents.append(newCurrent)
        }
    }
    
}