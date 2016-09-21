//
//  ChineseChefAcademy.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 9/21/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class ChineseChefAcademy: ChefAcademy {
	
	func createChef() -> Chef {
		return ChineseChef()
	}	
}