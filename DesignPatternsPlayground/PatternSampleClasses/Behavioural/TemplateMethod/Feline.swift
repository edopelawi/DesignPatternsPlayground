//
//  Feline.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/31/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum FelineGender {
    case Male
    case Female
    
    /**
     Returns lowercased subject pronoun for this gender.
     
     - returns: `String` instance.
     */
    func subjectPronoun() -> String {
        switch self {
        case .Female: return "she"
        case .Male: return "he"
        }
    }
    
    func possesivePronoun() -> String {
        switch self {
        case .Female: return "her"
        case .Male: return "his"
        }
    }
    
    func objectPronoun() -> String {
        switch self {
        case .Female: return "her"
        case .Male: return "him"
        }
    }
}

class Feline: AnyObject {
    
    /// Name of this instance.
    internal var name = ""
    
    internal var gender = FelineGender.Female
    
    /// Array of `FelineDailyActivity` that this instance do in morning.
    internal var morningActivity = [FelineDailyActivity]()
    
    /// Array of `FelineDailyActivity` that this instance do in afternoon.
    internal var afternoonActivity = [FelineDailyActivity]()
    
    /// Array of `FelineDailyActivity` that this instance do in evening.
    internal var eveningActivity = [FelineDailyActivity]()
    
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
    internal func stringForFelineActivity(activity: FelineDailyActivity) -> String {
        
        switch activity {
        case .Bath: return "Takes a bath."
        case .Bored: return "Licks \(gender.subjectPronoun()) paw and yawn."
        case .Eat: return "Drinks \((gender.subjectPronoun())) milk."
        case .Hunt: return "Looks for a mice and eat it as a snack."
        case .Play: return "Chase around \((gender.subjectPronoun())) wool ball."
        case .Sleep: return "Folds \((gender.subjectPronoun())) feet, sleep, and purrs."
            
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
    
    private func isOnlySleeping(activities: [FelineDailyActivity]) -> Bool {
        
        for activity in activities {
            if activity != .Sleep {
                return false
            }
        }
        
        return true
    }
    
    private func morningActivitySummary() -> String {
        
        var summary = "\n"
        summary += "In the morning, \(gender.subjectPronoun()):\n"
        
        for (index, activity) in morningActivity.enumerate() {
            let activityString = stringForFelineActivity(activity)
            summary += "\(index+1). \(activityString)\n"
        }
        
        return summary
    }
    
    private func afternoonActivitySummary() -> String {
        
        var summary = "\n"
        summary += "When the sun was high, \(gender.subjectPronoun()):\n"
        
        for (index, activity) in morningActivity.enumerate() {
            let activityString = stringForFelineActivity(activity)
            summary += "\(index+1). \(activityString)\n"
        }
        
        return summary
    }
    
    private func eveningActivitySummary() -> String {
        
        var summary = "\n"
        summary += "Later in the evening, \(gender.subjectPronoun()):\n"
        
        for (index, activity) in morningActivity.enumerate() {
            let activityString = stringForFelineActivity(activity)
            summary += "\(index+1). \(activityString)\n"
        }
        
        return summary
    }
}