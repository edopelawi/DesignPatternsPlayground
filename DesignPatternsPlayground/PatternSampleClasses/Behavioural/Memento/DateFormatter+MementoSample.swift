//
//  DateFormatter+MementoSample.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 4/27/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

extension DateFormatter {
	
	func stringForMementoSample(date: Date) -> String {
		
		dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
		
		return string(from: date)
	}
	
	func dateForMementoSample(string: String) -> Date? {
		
		dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
		
		return date(from: string)
	}
}
