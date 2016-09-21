//
//  ChefAcademy.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 9/21/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

protocol ChefAcademy {
	
	/**
	Creates `Chef` instance that fits this `ChefAcademy`.
	
	- returns: `Chef`-compliant instance.
	*/
	func createChef() -> Chef
}