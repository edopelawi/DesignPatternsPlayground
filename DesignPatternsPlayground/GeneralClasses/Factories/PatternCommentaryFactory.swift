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
    class func commentaryForCreationalPatternType(_ pattern: CreationalPatternType) -> String {
        let fileName = pattern.toString().replacingOccurrences(of: " ", with: "")
        return commentariesFromTextFile(fileName)
    }
    
    /// Returns `String` instance of commentaries of passed `pattern`.
    class func commentaryForStructuralPatternType(_ pattern: StructuralPatternType) -> String {
        let fileName = pattern.toString().replacingOccurrences(of: " ", with: "")
        return commentariesFromTextFile(fileName)
    }
    
    /// Returns `String` instance of commentaries of passed `pattern`.
    class func commentaryForBehaviouralPatternType(_ pattern: BehaviouralPatternType) -> String {
        let fileName = pattern.toString().replacingOccurrences(of: " ", with: "")
        return commentariesFromTextFile(fileName)
    }
    
    fileprivate class func commentariesFromTextFile(_ fileName: String) -> String {
    
        var comments = ""
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "txt") {
            
            do {
                comments = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            } catch {
                print("Failed to load \(fileName).txt. Please check if the file has proper name.")
            }
        }
     
        return comments
    }
}
