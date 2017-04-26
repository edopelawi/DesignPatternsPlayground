//
//  FoodType.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 9/21/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum FoodType: Int {
	
	case chinese = 0
	case western = 1
	case japanese = 2
	case indonesian = 3
	case others = 4
	
	/// Return total number of types.
	static func numberOfTypes() -> Int {
		return 5
	}
	
	static func stringForType(_ type: FoodType) -> String {
		
		switch type {
		case .chinese: return "Chinese"
		case .western: return "Western"
		case .japanese: return "Japanese"
		case .indonesian: return "Indonesian"
		case .others: return "Others"
		}
	}
}
