//
//  PatternCommentaryFactory.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/11/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class PatternCommentaryFactory {
        
    /// Returns `String` instance of commentaries of passed `pattern`.
    class func commentaryForCreationalPatternType(pattern: CreationalPatternType) -> String {
        let fileName = pattern.toString().stringByReplacingOccurrencesOfString(" ", withString: "")
        return commentariesFromTextFile(fileName)
    }
    
    /// Returns `String` instance of commentaries of passed `pattern`.
    class func commentaryForStructuralPatternType(pattern: StructuralPatternType) -> String {
        let fileName = pattern.toString().stringByReplacingOccurrencesOfString(" ", withString: "")
        return commentariesFromTextFile(fileName)
    }
    
    private class func commentariesFromTextFile(fileName: String) -> String {
    
        var comments = ""
        
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