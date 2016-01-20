//
//  JamesBondCarEngine.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/20/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

internal protocol JamesBondCarEngine {
    
    /// `String` that will be used as car's icon with this engine. Emojis are preferred.
    func carIcon() -> String
    
    /// `String` instance that represents this engine's sound.
    func engineSound() -> String
}