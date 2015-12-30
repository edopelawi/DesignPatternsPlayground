//
//  BuilderSampleViewModel.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/30/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum BurgerOrderRows: Int {
    case Burger = 0
    case Drinks = 1
    case Fries = 2
    case Salads = 3
    case Sweets = 4
    
    static func numberOfRows() -> Int {
        return 5
    }
    
    func toString() -> String {
        switch self {
        case .Burger: return "Burger"
        case .Drinks: return "Drinks"
        case .Fries: return "Fries"
        case .Salads: return "Salads"
        case .Sweets: return "Sweets"
        }
    }
}

enum BurgerOrderPackage: String {
    case Normal = "Normal Package"
    case Whopper = "WHOPPER™ Package"
}

class BuilderSampleViewModel {
    
    // MARK: Properties
    
    internal private(set) var orderPartNames: [ String ] = []
    
    internal var orderPartSelectedMarker: [ Bool ] = []
    
    internal private(set) var orderPackages = [
        BurgerOrderPackage.Normal.rawValue,
        BurgerOrderPackage.Whopper.rawValue
    ]
    
    internal var selectedPackage = BurgerOrderPackage.Normal
    
    // MARK: Public methods
    
    init() {
        prepareOrderPartNames()
        resetOrderPartSelections()
    }
    
    /// Sets this instance's `orderPartSelectedMarker` booleans to `false`.
    internal func resetOrderPartSelections() {
        
        orderPartSelectedMarker = Array(
            count: BurgerOrderRows.numberOfRows(),
            repeatedValue: false
        )
    }
    
    // MARK: Private methods
    
    private func prepareOrderPartNames() {

        for var index = 0; index < BurgerOrderRows.numberOfRows(); index += 1 {
            
            if let row = BurgerOrderRows(rawValue: index) {
                orderPartNames.append(row.toString())
            }
        }
    }
}