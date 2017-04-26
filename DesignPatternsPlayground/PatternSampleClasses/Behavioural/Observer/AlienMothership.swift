//
//  AlienMothership.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/30/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class AlienMothership {

    fileprivate var listeners = [AlienMothershipListener]()
    
    /// Message of this instance. Will call its `listeners` `handleMothershipMessage:` method.
    internal var message = AlienMothershipMessage.StayInPosition {
        didSet {
            for listener in listeners {
                listener.handleMothershipMessage(message)
            }
        }
    }
    
    /**
     Adds passed `listener` to this instance. Will not do anything if the instance passed
     already added before.
    
     - parameter listener: `AlienMothershipListener` compliant instance.
     */
    internal func addListener(_ listener: AlienMothershipListener) {
        
        if listeners.contains(where: { Unmanaged<AnyObject>.passUnretained($0).toOpaque() == Unmanaged<AnyObject>.passUnretained(listener).toOpaque()}) {
            return
        }
        
        listeners.append(listener)
        listener.handleMothershipMessage(message)
    }
    
    /**
     Removes passed `listener` from this instance. Will not do anything if the instance passed
     isn't added before.
     
     - parameter listener: `AlienMothershipListener` compliant instance.
     */
    internal func removeListener(_ listener: AlienMothershipListener) {
        let optionalIndex = listeners.index(where: { $0 === listener })
        
        guard let objectIndex = optionalIndex else {
                
            return
        }
        
        listeners.remove(at: objectIndex)
    }
}
