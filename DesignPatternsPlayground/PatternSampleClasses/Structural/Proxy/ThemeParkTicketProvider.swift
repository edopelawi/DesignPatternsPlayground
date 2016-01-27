//
//  ThemeParkTicketProvider.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/26/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

protocol ThemeParkTicketProvider {

    /// Returns `String` instance of ticket code for passed `ThemeParkVisitor`.
    func retrieveTicketForVisitor(visitor: ThemeParkVisitor) -> String
}

