//
//  ChristmasDecoration.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 2/23/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

// TODO: Implement this later.

class ChristmasDecoration: DCRechargeableBatteryDelegate {
  
    private var baseVoltage = ChristmasLights.preferredVoltage
    
    internal var battery: DCRechargeableBattery!
    internal var christmasLights = [ChristmasLights]()
    
    internal var batteryChargeUpdatedBlock: ((numberOfCharge: Int) -> Void)?
    
    init() {
        battery = DCRechargeableBattery(voltage: baseVoltage)
        battery.delegate = self        
    }
    
    // MARK: DCRechargeableBatteryDelegate
    
    func battery(battery: DCRechargeableBattery, numberOfCurrentsUpdated: Int) {
        
        if let chargeUpdatedBlock = self.batteryChargeUpdatedBlock {
            chargeUpdatedBlock(numberOfCharge: numberOfCurrentsUpdated);
        }
    }
    
    // MARK: Public methods
    
    internal func addChristmasLights() {
        let newChristmasLight = ChristmasLights(battery: battery);
        newChristmasLight.turnOn();
        
        christmasLights.append(newChristmasLight);
    }
    
    internal func rechargeBatteryVoltage() {
        battery.rechargeCurrents(100);
    }
    
    internal func turnAllLightsOn() {
        for christmasLight in christmasLights {
            christmasLight.turnOn();
        }
    }
    
    internal func turnAllLightsOff() {
        for christmasLight in christmasLights {
            christmasLight.turnOff();
        }
    }
};