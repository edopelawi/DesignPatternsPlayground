//
//  PatternCommentaryFactory.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/11/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class PatternCommentaryFactory {
    
    class func commentaryForCreationalPattern(pattern: CreationaPatternType) -> String {

        var comments = ""
        
        let fileName = pattern.toString().stringByReplacingOccurrencesOfString(" ", withString: "")
        
        if let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "txt") {
            
            do {
                comments = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            } catch {
                print("Failed to load \(fileName).txt. Please check if the file has proper name.")
            }
        }
        
        return comments
    }
}