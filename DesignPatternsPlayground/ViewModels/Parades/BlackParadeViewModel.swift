//
//  BlackParadeViewModel.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/30/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class BlackParadeViewModel: ParadeViewModel {
    
    override func retrieveParade() -> Parade {        
        return Parade(
            name: "Black Parade",
            members: "🌚 👻 💀 👻 💀 🌚"
        )
    }
}