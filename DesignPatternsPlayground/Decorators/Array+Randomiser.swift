//
//  Array+Randomiser.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/28/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation


extension Array {
 
    /// Returns a random instance in this array. Will return `nil` if this array is empty.
    func randomElement() -> Element? {

        if count == 0 {
            return nil
        }
        
        let selectedIndex = Int(arc4random_uniform(UInt32(count)))
        
        return self[selectedIndex] as? Element
    }
}