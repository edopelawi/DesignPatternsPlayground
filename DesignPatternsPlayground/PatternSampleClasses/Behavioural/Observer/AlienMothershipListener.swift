//
//  AlienMothershipListener.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/30/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

protocol AlienMothershipListener {
    
    /**
     This method will be called when by this instance's `AlienMothership` it listened into
     sends new message.
     
     - parameter message: `String` instance.
     */
    func handleMothershipMessage(message: String)
}
