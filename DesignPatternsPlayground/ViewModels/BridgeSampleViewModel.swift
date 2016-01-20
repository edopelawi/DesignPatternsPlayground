//
//  BridgeSampleViewModel.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/20/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation
import JamesBondTools

class BridgeSampleViewModel {
    
    /// Contains array of `JamesBondTerrainType` options.
    internal var terrainOptions = [
        JamesBondTerrainType.Air,
        JamesBondTerrainType.Mountain,
        JamesBondTerrainType.Road,
        JamesBondTerrainType.Sea
    ]
    
    /// Selected `JamesBondTerrainType` of this instance.
    internal var selectedTerrain =  JamesBondTerrainType.Road {
        didSet {
            updateTerrainString()
        }
    }
    
    /// Stores `String` of emoji representation of current `selectedTerrain`.
    internal var terrain = ""
    
    /// Stores `String` of emoji and text representation of bond car for currently `selectedTerrain`.
    internal var bondCarWithEffects = ""
    
    private var bondCar: JamesBondCar! {
        didSet {
            updateBondCarWithEffectsString()
        }
    }
    
    
    init() {
        updateTerrainString()
        updateBondCarForCurrentTerrain()
    }
    
    // MARK: Private methods
    
    private func updateBondCarForCurrentTerrain() {
        bondCar = JamesBondCar(terrainType: selectedTerrain)
    }
    
    private func updateBondCarWithEffectsString() {
        bondCarWithEffects = "\(bondCar.carIcon())💨 \(bondCar.engineSound())"
    }
    
    private func updateTerrainString() {

        let repeatCount = 20
        let terrainIconCharacter = Character(selectedTerrain.terrainIcon())
        
        terrain = String(count: repeatCount, repeatedValue: terrainIconCharacter)
    }
}