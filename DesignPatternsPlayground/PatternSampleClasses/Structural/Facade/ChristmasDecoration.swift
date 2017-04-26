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
  
    fileprivate var baseVoltage = ChristmasLights.preferredVoltage
    
    /// This instance's `DCRechargeableBattery` that used to power its `christmasLights`.
    internal var battery: DCRechargeableBattery!
    
    /// Array of `ChristmasLights` that managed by this instance.
    internal var christmasLights = [ChristmasLights]()
    
    /// Block that will be executed each time this instance's `battery` is charged.
    internal var batteryChargeUpdatedBlock: ((_ numberOfCharge: Int) -> Void)?
    
    /// Block that will be executed each time any of `ChristmasLights` got its lights updated.
    internal var christmasLightUpdatedBlock: ((_ indexOfLight: Int, _ christmasLight: ChristmasLights) -> Void)?
    
    init() {
        battery = DCRechargeableBattery(voltage: baseVoltage)
        battery.delegate = self        
    }
    
    // MARK: DCRechargeableBatteryDelegate
    
    func battery(_ battery: DCRechargeableBattery, numberOfCurrentsUpdated: Int) {
        
        if let chargeUpdatedBlock = self.batteryChargeUpdatedBlock {
            chargeUpdatedBlock(numberOfCurrentsUpdated);
        }
    }
    
    // MARK: Public methods
    
    internal func addChristmasLights() {
        let newChristmasLight = ChristmasLights(battery: battery);
        
        let lightIndex = christmasLights.count
        newChristmasLight.lightEmojisChangedBlock = {
            [weak self] _ in
            
            if let strongSelf = self,
               let validBlock = strongSelf.christmasLightUpdatedBlock {
                validBlock(lightIndex, newChristmasLight)
            }
            
        };
        
        christmasLights.append(newChristmasLight);
        
        newChristmasLight.turnOn();
    }
    
    internal func rechargeBattery() {
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
