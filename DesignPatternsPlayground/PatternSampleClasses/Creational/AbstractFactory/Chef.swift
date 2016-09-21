//
//  Chef.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/23/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

/**
This class is created for Abstract Factory sample.
*/
protocol Chef {
	
	/// Name of this `Chef`.
	var name: String { get }
	
    /// Returns `Food` that suits this `Chef`.
    func cook() -> Food
}