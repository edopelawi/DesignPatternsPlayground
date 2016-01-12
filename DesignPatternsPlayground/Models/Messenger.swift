//
//  Messenger.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/12/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class Messenger: NSObject, NSCopying {
    
    internal var name: String
    internal var message: String
    
    required init(name: String, message: String){
        self.name = name
        self.message = message
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        return Messenger(name: self.name, message: self.message)
    }
}