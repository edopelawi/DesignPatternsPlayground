//
//  IndonesianChefAcademy.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 9/21/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class IndonesianChefAcademy: ChefAcademy {
	
	let chefNames = [
		"Felix Budisetiawan",
		"Arnold Poernomo",
		"Zulkarnaini ‘Zul’ Dahlan",
		"Chandra Yudaswara"
	]
	
	func createChef() -> Chef {
		
		let name = chefNames.randomElement() ?? ""
		return IndonesianChef(name: name)
	}
}