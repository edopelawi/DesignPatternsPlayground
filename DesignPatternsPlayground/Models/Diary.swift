//
//  Diary.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/13/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class Diary {
    
    static private var privateSingletonDiary: Diary = {

        // Added delay to simulate long-running instance construction        
        sleep(3)
        
        var newDiary = Diary(
            name: "My Diary",
            diaryText: "Dear diary, why do I like dairy?"
        )
        
        print("privateSingletonDiary is created!")
        
        return newDiary
    }()
    
    /// Returns shared `Diary` instance that used throughout the app.
    static internal var sharedDiary: Diary {
        return privateSingletonDiary
    }
    
    internal var name: String
    internal var diaryText: String
    
    /// Private initializer, because Singleton!
    private init(name: String, diaryText: String) {
        self.name = name
        self.diaryText = diaryText
    }
}