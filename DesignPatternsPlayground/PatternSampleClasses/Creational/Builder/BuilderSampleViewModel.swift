//
//  BuilderSampleViewModel.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/30/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum BurgerOrderRows: Int {
    case burger = 0
    case drinks = 1
    case fries = 2
    case salads = 3
    case sweets = 4
    
    static func numberOfRows() -> Int {
        return 5
    }
    
    func toString() -> String {
        switch self {
        case .burger: return "Burger"
        case .drinks: return "Drinks"
        case .fries: return "Fries"
        case .salads: return "Salads"
        case .sweets: return "Sweets"
        }
    }
}

enum BurgerOrderPackage: String {
    case Normal = "Normal Package"
    case Whopper = "WHOPPER™ Package"
}

protocol BuilderSampleViewModelDelegate: class {

    /// This method will be called when passed `viewModel`'s `selectedPackage` is changed.
    /// Will pass the latest `BurgerOrderPackage` through `selectedPackageChanged` parameter.
    func viewModel(_ viewModel: BuilderSampleViewModel, selectedPackageChanged: BurgerOrderPackage);
}

class BuilderSampleViewModel {
    
    // MARK: Properties
    
    internal fileprivate(set) var orderPartNames: [ String ] = []
    
    internal var orderPartSelectedMarker: [ Bool ] = []
    
    internal fileprivate(set) var orderPackages = [
        BurgerOrderPackage.Normal.rawValue,
        BurgerOrderPackage.Whopper.rawValue
    ]
    
    internal var selectedPackage = BurgerOrderPackage.Normal {
        didSet {
            delegate?.viewModel(self, selectedPackageChanged: selectedPackage)
        }
    }
    
    weak internal var delegate: BuilderSampleViewModelDelegate?
    
    // MARK: Public methods
    
    init() {
        prepareOrderPartNames()
        resetOrderPartSelections()
    }
    
    /// Sets this instance's `orderPartSelectedMarker` booleans to `false`.
    internal func resetOrderPartSelections() {
        
        orderPartSelectedMarker = Array(
            repeating: false,
            count: BurgerOrderRows.numberOfRows()
        )
    }
    
    /// Create `BurgerOrder` instance based on current package and selections.
    internal func createBurderOrder() -> BurgerOrder {
        
        var builder: BurgerOrderBuilder
        
        if selectedPackage == .Normal {
            builder = NormalBurgerOrderBuilder()
        } else {
            builder = WhopperBurgerOrderBuilder()
        }
        
        return buildOrderWithBuilder(builder)
    }
    
    // MARK: Private methods
    
    fileprivate func prepareOrderPartNames() {

        for index in 0 ..< BurgerOrderRows.numberOfRows() {
            
            if let row = BurgerOrderRows(rawValue: index) {
                orderPartNames.append(row.toString())
            }
        }
    }
    
    fileprivate func buildOrderWithBuilder(_ builder: BurgerOrderBuilder) -> BurgerOrder {

        for (index, selected) in orderPartSelectedMarker.enumerated() {
            
            if let row = BurgerOrderRows(rawValue: index), selected {
                
                switch row {
                case .burger: builder.addBurger()
                case .drinks: builder.addDrinks()
                case .fries: builder.addFries()
                case .salads: builder.addSalad()
                case .sweets: builder.addSweets()
                }
            }
        }
        
        return builder.makeOrder()
    }
}
