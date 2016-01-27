//
//  DesertParadeViewModel.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/29/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class DesertParadeViewModel: ParadeViewModel {
    
    
    override func retrieveParade() -> Parade {
        
        return Parade(
            name: "Desert Parade",
            members: "🐪 🐪 🐫 🐫"
        )
    }
}