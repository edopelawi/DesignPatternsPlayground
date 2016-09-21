//
//  JapaneseChefAcademy.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 9/21/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class JapaneseChefAcademy: ChefAcademy {
	
	
	let chefNames = [
		"Chen Kenichi",
		"Hanaya Yohei",
		"Harumi Kurihara",
		"Hiroyuki Sakai",
		"Masaharu Morimoto",
		"Nobu Matsuhisa",
		"Rokusaburo Michiba"
	]
	
	func createChef() -> Chef {
		
		let name = chefNames.randomElement() ?? ""
		return JapaneseChef(name: name)
	}
}