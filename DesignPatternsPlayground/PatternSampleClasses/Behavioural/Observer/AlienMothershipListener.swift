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
     Returns `String` representation of this `listener`. May be not unique.
     
     - returns: `String` instance.
     */
    func shipIdentifier() -> String
}
