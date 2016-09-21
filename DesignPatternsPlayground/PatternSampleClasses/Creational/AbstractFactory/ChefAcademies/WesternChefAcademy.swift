//
//  WesternChefAcademy.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 9/21/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class WesternChefAcademy: ChefAcademy {
	
	let chefNames = [
		"Jennifer Jasinski",
		"Jeff Drew",
		"Daniel Patterson",
		"Corey Lee",
		"Gary Kucy",
		"Jon Shook",
		"Vinny Dotolo"
	]
	
	func createChef() -> Chef {
		
		let name = chefNames.randomElement() ?? ""
		return WesternChef(name: name)
	}
}