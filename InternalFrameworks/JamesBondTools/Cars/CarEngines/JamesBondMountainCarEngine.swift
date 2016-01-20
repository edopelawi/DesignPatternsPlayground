//
//  JamesBondMountainCarEngine.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/20/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

internal class JamesBondMountainCarEngine: JamesBondCarEngine {
    
    func carIcon() -> String {
        return "🚚"
    }
    
    func engineSound() -> String {
        return "ROOOOOORM!"
    }
}