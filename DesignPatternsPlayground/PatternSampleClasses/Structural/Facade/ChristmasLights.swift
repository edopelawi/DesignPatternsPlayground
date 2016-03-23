//
//  ChristmasLights.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 2/15/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class ChristmasLights {
    
    private var battery: DCRechargeableBattery
    private var timer: NSTimer?
    
    /// Emojis that used to present this instance.
    internal var lightEmojis = "" {
        didSet {
            if let validChangeBlock = lightEmojisChangedBlock {
                validChangeBlock(lightEmojis: lightEmojis);
            }
        }
    }
    
    /// Block that will be executed when this instace's `lightEmojis` changed.
    internal var lightEmojisChangedBlock: ((lightEmojis: String) -> Void)?
    
    static internal let minimumVoltage = 0.3
    static internal let preferredVoltage = 0.5
    static internal let maximumVoltage = 0.6
    
    internal let minimumDCCurrent = 5
    
    private let refreshEmojiInterval = NSTimeInterval(0.5)
    
    private let lightEmojisDefaultLength = 12
    
    static private let validEmojis = [
        "❤️", "💜", "💛",
        "💚", "💙", "🔴",
        "🔵", "🔶", "🔷",
        "⭐️", "✨", "⚪️"
    ]
    
    init(battery: DCRechargeableBattery) {
        self.battery = battery
        turnOn()
    }
    
    deinit {
        timer?.invalidate()
    }
    
    /**
    Periodically change this instance's `lightEmojis` as long as its `battery` has enough `DCCurrent` and matching voltage.
    */
    internal func turnOn() {
        
        if timer != nil {
            return
        }
        
        refreshLightEmoji()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(self.refreshEmojiInterval,
            target: self,
            selector: Selector("refreshLightEmoji"),
            userInfo: nil,
            repeats: true
        )
    }
    
    /**
    Resets this instance's `lightEmojis` and stops it from request `DCCurrent`s from its battery.
    */
    internal func turnOff() {
        timer?.invalidate()
        timer = nil
        
        lightEmojis = ""
    }
    
    @objc private func refreshLightEmoji() {
        
        let validVoltage = (battery.voltage <= ChristmasLights.maximumVoltage) && (battery.voltage >= ChristmasLights.minimumVoltage)
        
        if !validVoltage {
            turnOff()
            return
        }
        
        let availableCurrents = battery.retrieveCurrents(minimumDCCurrent)
        
        if availableCurrents.count < minimumDCCurrent {
            turnOff()
            return
        }
        
        lightEmojis = retrieveRandomEmojis()
    }
    
    private func retrieveRandomEmojis() -> String {
        
        let voltageRatio = Double(battery.voltage / ChristmasLights.preferredVoltage)
        let emojisLength = lightEmojisDefaultLength * Int(ceil(voltageRatio))
        
        var emojis = ""
        
        for _ in 0 ..< emojisLength {
            
            if let randomisedEmoji = ChristmasLights.validEmojis.randomElement() {
                emojis.appendContentsOf(randomisedEmoji)
            }
        }
        
        return emojis
    }
    
}