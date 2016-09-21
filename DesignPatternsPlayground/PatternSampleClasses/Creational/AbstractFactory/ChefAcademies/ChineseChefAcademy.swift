//
//  ChineseChefAcademy.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 9/21/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class ChineseChefAcademy: ChefAcademy {
	
	let chefNames = [
		"Wong Wing-chee",
		"Chan Yan-tak",
		"Mok Kit-keung",
		"Dong Zhenxiang"
	]
	
	func createChef() -> Chef {
		
		let name = chefNames.randomElement() ?? ""
		return ChineseChef(name: name)
	}	
}