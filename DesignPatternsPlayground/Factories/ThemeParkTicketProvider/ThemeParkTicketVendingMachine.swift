//
//  ThemeParkTicketVendingMachine.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/26/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class ThemeParkTicketVendingMachine: ThemeParkTicketProvider {
    
    func retrieveTicketForVisitor(visitor: ThemeParkVisitor) -> String {
        
        let visitorAddress = unsafeAddressOf(visitor)
        let ticketCode = "\(visitorAddress)".uppercaseString
        
        return ticketCode
    }
    
}