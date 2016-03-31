//
//  AlienMothershipListener.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/30/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

protocol AlienMothershipListener: AnyObject {
    
    /**
     This method will be called when by this instance's `AlienMothership` it listened into
     sends new message.
     
     - parameter message: `AlienMothershipMessage` instance.
     */
    func handleMothershipMessage(message: AlienMothershipMessage)
    
    /**
     Returns `String` representation of this instance's current status. 
     
     - note: This might return different results based on mothership's message this instance's listened into.
     
     - returns: `String` instance.
     */
    func shipCurrentStatus() -> String
}
