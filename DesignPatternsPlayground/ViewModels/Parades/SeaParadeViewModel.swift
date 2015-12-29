//
//  SeaParadeViewModel.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/29/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class SeaParadeViewModel: ParadeViewModel {
    
    override func retrieveParade() -> Parade {
        
        return Parade(
            name: "Sea Parade",
            members: "🐋 🐳 🐬 🐙 🐠 🐡"
        )
    }
}