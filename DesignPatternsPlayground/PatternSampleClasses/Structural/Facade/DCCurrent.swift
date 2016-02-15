//
//  DCCurrent.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 2/15/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

struct DCCurrent {
    
    internal private(set) var voltage: Int
    
    init(voltage: Int) {
        self.voltage = voltage
    }
}
