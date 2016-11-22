//
//  Feline.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/31/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum FelineGender {
    case male
    case female
    
    /**
     Returns lowercased subject pronoun for this gender.
     
     - returns: `String` instance.
     */
    func subjectPronoun() -> String {
        switch self {
        case .female: return "she"
        case .male: return "he"
        }
    }
    
    func possesivePronoun() -> String {
        switch self {
        case .female: return "her"
        case .male: return "his"
        }
    }
    
    func objectPronoun() -> String {
        switch self {
        case .female: return "her"
        case .male: return "him"
        }
    }
}

class Feline: AnyObject {
    
    /// Name of this instance.
    internal var name: String
    
    internal var gender: FelineGender
    
    /// Array of `FelineDailyActivity` that this instance do in morning.
    internal var morningActivity = [FelineDailyActivity]()
    
    /// Array of `FelineDailyActivity` that this instance do in afternoon.
    internal var afternoonActivity = [FelineDailyActivity]()
    
    /// Array of `FelineDailyActivity` that this instance do in evening.
    internal var eveningActivity = [FelineDailyActivity]()
    
    required init(name: String, gender: FelineGender) {
        self.name = name
        self.gender = gender
    }
    
    /**
     This method will be called before the daily activities is executed in the `liveAnotherDay` method.
     
     - note: This method is empty by default. You can override this method on the subclass to update this instance's activities.
     */
    internal func planDailyActivity() {
        
    }
    
    /**
     Returns `String` representation of passed `activity`.
     
     - note: This method has its own implementation. Still, you can override it on the subclass.
     
     - parameter activity: `FelineDailyActivity` value.
     
     - returns: `String` instance.
     */
    internal func stringForFelineActivity(_ activity: FelineDailyActivity) -> String {
        
        switch activity {
        case .bath: return "Takes a bath."
        case .bored: return "Licks \(gender.possesivePronoun()) paw and yawn."
        case .eat: return "Drinks \((gender.subjectPronoun())) milk."
        case .hunt: return "Looks for a mice and eat it as a snack."
        case .play: return "Chase around \((gender.subjectPronoun())) wool ball."
        case .sleep: return "Folds \(gender.possesivePronoun()) feet, sleep, and purrs."
            
        }
    }
    
    /**
     Returns `String` representation of this instance's daily activities. Will call this instance's `planDailyActivity` and `stringForFelineActivity:`.
     
     - returns: `String` instance.
     */
    final internal func liveAnotherDay () -> String {
        
        planDailyActivity()
        
        var allDailyActivity = "Here's the summary of \(name)'s today's activity:\n"
        
        let didNothing = morningActivity.isEmpty && afternoonActivity.isEmpty && eveningActivity.isEmpty
        
        if didNothing {
            allDailyActivity += "\(name) did nothing. Maybe \(gender.subjectPronoun())'s having a bad day, who knows?"
            return allDailyActivity
        }
        
        let sleepsAllDay = isOnlySleeping(morningActivity) && isOnlySleeping(afternoonActivity) && isOnlySleeping(eveningActivity)
        
        if sleepsAllDay {
            allDailyActivity += "\(name) sleeps all day. Perhaps \(gender.subjectPronoun())'s tired... or having a good dream, who knows?"
            return allDailyActivity
        }
        
        allDailyActivity += morningActivitySummary()
        allDailyActivity += afternoonActivitySummary()
        allDailyActivity += eveningActivitySummary()
        
        allDailyActivity += "\n"
        allDailyActivity += "And that's how \(name)'s day goes. See you tomorrow!"
        
        return allDailyActivity
    }
    
    // MARK: - Private methods -
    
    fileprivate func isOnlySleeping(_ activities: [FelineDailyActivity]) -> Bool {
        
        for activity in activities {
            if activity != .sleep {
                return false
            }
        }
        
        return true
    }
    
    fileprivate func morningActivitySummary() -> String {
        
        var summary = "\n"
        summary += "In the morning, \(gender.subjectPronoun()):\n"
        
        for (index, activity) in morningActivity.enumerated() {
            let activityString = stringForFelineActivity(activity)
            summary += "\(index+1). \(activityString)\n"
        }
        
        return summary
    }
    
    fileprivate func afternoonActivitySummary() -> String {
        
        var summary = "\n"
        summary += "When the sun was high, \(gender.subjectPronoun()):\n"
        
        for (index, activity) in afternoonActivity.enumerated() {
            let activityString = stringForFelineActivity(activity)
            summary += "\(index+1). \(activityString)\n"
        }
        
        return summary
    }
    
    fileprivate func eveningActivitySummary() -> String {
        
        var summary = "\n"
        summary += "Later in the evening, \(gender.subjectPronoun()):\n"
        
        for (index, activity) in eveningActivity.enumerated() {
            let activityString = stringForFelineActivity(activity)
            summary += "\(index+1). \(activityString)\n"
        }
        
        return summary
    }
}
