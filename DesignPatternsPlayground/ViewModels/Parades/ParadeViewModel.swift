//
//  ParadeViewModel.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/29/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class ParadeViewModel {
    
    internal func decoratedParadeName() -> String {
        let paradeName = retrieveParade().name
        
        return "✨✨ \(paradeName) ✨✨"
    }
    
    internal func decoratedParadeMembers() -> String {
        let paradeMembers = retrieveParade().members
        
        return "🎉🎉🎊🎊🎈 \(paradeMembers) 🎈🎊🎊🎉🎉"
    }
    
    /**
    Returns `Parade` instance that will be used in this instance's methods.
    
    - note: Override this method to customize parades.
    - returns: `Parade` instance.
    */
    internal func retrieveParade() -> Parade {
        
        let parade = Parade(
            name:"Sample Parade",
            members: "😄 😄 😄"
        )
        
        return parade
    }
}