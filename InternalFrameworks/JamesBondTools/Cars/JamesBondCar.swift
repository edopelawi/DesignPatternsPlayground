//
//  JamesBondCar.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/20/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

public enum JamesBondTerrainType: String {
    case Air = "Air"
    case Road = "Road"
    case Mountain = "Mountain"
    case Sea = "Sea"
    
    
    /// Returns `String` instance representation of current this terrain. Mostly emojis.
    public func terrainIcon() -> String {
        switch self {
        case.Air: return "☁️"
        case .Road: return "🚧"
        case .Mountain: return "🗻"
        case .Sea: return "🌊"
        }
    }
}

public class JamesBondCar {
    
    private var engine: JamesBondCarEngine
    
    public init(terrainType: JamesBondTerrainType) {

        switch terrainType {
        case .Air: engine = JamesBondAirCarEngine()
        case .Mountain: engine = JamesBondMountainCarEngine()
        case .Road: engine = JamesBondRoadCarEngine()
        case .Sea: engine = JamesBondSeaCarEngine()
        }
    }
    
    /// Returns this car's icon as `String` instance. Mostly emojis.
    public func carIcon() -> String {
        return engine.carIcon()
    }
    
    /// Returns this car's sound as `String` instance.
    public func engineSound() -> String {
        return engine.engineSound()
    }
    
    
}