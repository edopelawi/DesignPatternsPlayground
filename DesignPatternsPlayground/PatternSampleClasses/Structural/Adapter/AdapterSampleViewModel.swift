//
//  AdapterSampleViewModel.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/19/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum AdapterSamplePlace: String {
    case None = "None"
    case HiddenLeaves = "Hidden Leaves"
    case AntipodeanTrees = "Antipodean Trees"
    case TropicalJungle = "Tropical Jungle"
    case BambooForest = "Bamboo Forest"
    case RotanaHometown = "Rotana's Hometown"
}

enum AdapterSampleOrder: String {
    case None = "None"
    case Food = "Food"
    case Drinks = "Drinks"
}

protocol AdapterSampleViewModelDelegate: class {
    
    /// Executed when passed `viewModel`'s `currentDialogue` is updated.
    func currentDialogueUpdated(_ viewModel: AdapterSampleViewModel, currentDialogue: String)

    /// Executed when passed `viewModel`'s `selectedPlace` is updated.
    func selectedPlaceUpdated(_ viewModel: AdapterSampleViewModel, selectedPlace: AdapterSamplePlace)
    
    /// Executed when passed `viewModel`'s `selectedOrder` is updated.
    func selectedOrderUpdated(_ viewModel: AdapterSampleViewModel, selectedOrder: AdapterSampleOrder)
}

class AdapterSampleViewModel {
    
    /// Array of `AdapterSamplePlace` enum options.
    internal var placeOptions = [
        AdapterSamplePlace.None,
        AdapterSamplePlace.HiddenLeaves,
        AdapterSamplePlace.AntipodeanTrees,
        AdapterSamplePlace.TropicalJungle,
        AdapterSamplePlace.BambooForest,
        AdapterSamplePlace.RotanaHometown
    ]
    
    /// Array of `AdapterSampleOrder` enum options.
    internal var orderOptions = [
        AdapterSampleOrder.None,
        AdapterSampleOrder.Food,
        AdapterSampleOrder.Drinks
    ]
    
    /// Stores selected `AdapterSamplePlace`. Assigning this property will update
    /// `currentDialogue` property.
    ///
    /// - note: The update might not applied immediately.
    internal var selectedPlace = AdapterSamplePlace.None {
        didSet {
            bearTourist.tourGuide = tourGuideForPlace(selectedPlace)
            updateCurrentDialogue()
            delegate?.selectedPlaceUpdated(self, selectedPlace: selectedPlace)
        }
    }

    /// Stores selected `AdapterSampleOrder`. Assigning this property will update
    /// `currentDialogue` property.
    ///
    /// - note: The update might not applied immediately.
    internal var selectedOrder = AdapterSampleOrder.None {
        didSet {
            updateCurrentDialogue()
            delegate?.selectedOrderUpdated(self, selectedOrder: selectedOrder)
        }
    }
    
    internal var currentDialogue = "" {
        didSet {
            delegate?.currentDialogueUpdated(self, currentDialogue: currentDialogue)
        }
    }
    
    weak internal var delegate: AdapterSampleViewModelDelegate?
    
    // MARK: Animal Chefs
    
    fileprivate let catChef = CatChef()
    fileprivate let koalaChef = KoalaChef()
    fileprivate let monkeyChef = MonkeyChef()
    fileprivate let pandaChef = PandaChef()
    
    // MARK: Tour Guides
    
    fileprivate var catTourGuide: CatCulinaryTourGuide!
    fileprivate var koalaTourGuide: KoalaCulinaryTourGuide!
    fileprivate var monkeyTourGuide: MonkeyCulinaryTourGuide!
    fileprivate var pandaTourGuide: PandaCulinaryTourGuide!
    fileprivate var bearTourGuide: BearCulinaryTourGuide!
    
    // MARK: Bear Tourist
    
    fileprivate var bearTourist = BearCulinaryTourist()
    
    init() {
        prepareTourGuides()
        updateCurrentDialogue()
    }
    
    // MARK: Private methods
    
    fileprivate func prepareTourGuides() {
        catTourGuide = CatCulinaryTourGuide(chef: catChef)
        koalaTourGuide = KoalaCulinaryTourGuide(chef: koalaChef)
        monkeyTourGuide = MonkeyCulinaryTourGuide(chef: monkeyChef)
        pandaTourGuide = PandaCulinaryTourGuide(chef: pandaChef)
        bearTourGuide = BearCulinaryTourGuide()
    }
    
    fileprivate func tourGuideForPlace(_ place: AdapterSamplePlace) -> AnimalCulinaryTourGuide? {
        switch place {
        case .None: return nil
        case .AntipodeanTrees: return koalaTourGuide
        case .BambooForest: return pandaTourGuide
        case .TropicalJungle: return monkeyTourGuide
        case .HiddenLeaves: return catTourGuide
        case .RotanaHometown: return bearTourGuide
        }
    }
    
    fileprivate func updateCurrentDialogue() {
        currentDialogue = ""
        
        switch selectedOrder {
            
        case .None: currentDialogue = "(Please select a valid Order first!)"
        case .Drinks:
            
            bearTourist.requestDrinks({
                [weak self] dialogue in
                self?.currentDialogue = dialogue.createFullDialogueString()
                })
            
        case .Food:
            
            bearTourist.requestFood({
                [weak self] dialogue in
                self?.currentDialogue = dialogue.createFullDialogueString()
                })
        }
    }
    
    
}
