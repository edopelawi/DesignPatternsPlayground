//
//  ChefAcademyAgency.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 9/21/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation


class ChefAcademyAgency {
	
	/**
	Returns suitable `ChefAcademy` for passed `foodType`.
	
	- parameter foodType: `FoodType` value.
	
	- returns: `ChefAcademy`-compliant instance.
	*/
	static func getAcademyForFoodType(foodType: FoodType) -> ChefAcademy {
	
		switch foodType {
		case .Chinese: return ChineseChefAcademy()
		case .Indonesian: return IndonesianChefAcademy()
		case .Japanese: return JapaneseChefAcademy()
		case .Others: return OtherCuisineChefAcademy()
		case .Western: return WesternChefAcademy()
		}
	}
}