//
//  ThemeParkTicketSalesPerson.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/26/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class ThemeParkTicketSalesPerson: ThemeParkTicketProvider {
    
    fileprivate var vendingMachine = ThemeParkTicketVendingMachine()
    internal let minimumVisitorHeight = 140
    
    
    /// Returns ticket code for `visitor` that has height that equals or more than
    /// `minimumVisitorHeight`. Will return empty `String` for visitor that doesn't meet
    /// the requirements.
    func retrieveTicketForVisitor(_ visitor: ThemeParkVisitor) -> String  {
        
        if visitor.height >= minimumVisitorHeight {
            return vendingMachine.retrieveTicketForVisitor(visitor)
        } else {
            return ""
        }
    }
}
