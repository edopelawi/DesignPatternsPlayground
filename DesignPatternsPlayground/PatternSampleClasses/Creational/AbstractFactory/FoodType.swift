//
//  FoodType.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 9/21/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum FoodType: Int {
	case Chinese = 0
	case Western = 1
	case Japanese = 2
	case Indonesian = 3
	case Others = 4
	
	/// Return total number of types.
	static func numberOfTypes() -> Int {
		return 5
	}
	
	static func stringForType(type: FoodType) -> String {
		
		switch type {
		case .Chinese: return "Chinese"
		case .Western: return "Western"
		case .Japanese: return "Japanese"
		case .Indonesian: return "Indonesian"
		case .Others: return "Others"
		}
	}
}