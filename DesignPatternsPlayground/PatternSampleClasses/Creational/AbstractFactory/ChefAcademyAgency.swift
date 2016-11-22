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
	static func getAcademyForFoodType(_ foodType: FoodType) -> ChefAcademy {
	
		switch foodType {
		case .chinese: return ChineseChefAcademy()
		case .indonesian: return IndonesianChefAcademy()
		case .japanese: return JapaneseChefAcademy()
		case .others: return OtherCuisineChefAcademy()
		case .western: return WesternChefAcademy()
		}
	}
}
