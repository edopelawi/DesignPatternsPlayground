//
//  SkyParadeViewModel.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/29/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class SkyParadeViewModel: ParadeViewModel {
    
    override func retrieveParade() -> Parade {
        return Parade(
            name: "Sky Parade",
            members: "☁️ 🌝 🌞 🌞 🌝 ☁️"
        )
    }
}