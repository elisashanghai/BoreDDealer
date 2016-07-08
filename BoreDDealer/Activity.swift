//
//  Activity.swift
//  BoreDDealer
//
//  Created by Brittiny Tran on 7/7/16.
//  Copyright © 2016 WhenYouBored. All rights reserved.
//

import Foundation


enum ActivityDuration: Int {
    case ThirtyMin = 30, SixtyMin = 60
}

class Activity {
    let duration: ActivityDuration
    let title: String
    
    init(title: String, duration: ActivityDuration) {
        self.title = title
        self.duration = duration
    }
    

    // array of short activities
    
    
    static var shortArray = [Activity(title: "Read a new book!", duration: .ThirtyMin),
                             Activity(title: "Make a bucket list of 20 things you want to do before you die!", duration: .ThirtyMin),
                             Activity(title: "Start watching a new TV Series!", duration: .ThirtyMin),
                             Activity(title: "Bake something!", duration: .ThirtyMin),
                             Activity(title: "Write a letter for someone you care about!", duration: .ThirtyMin),
                             Activity(title: "Go biking in a park near you!", duration: .ThirtyMin),
                             Activity(title: "Take a 30 minute nap and feel refreshed!", duration: .ThirtyMin),
                             Activity(title: "Learn about a sport that's popular in another country besides the one you reside in!", duration: .ThirtyMin),
                             Activity(title: "Make a drawing of the first thing you see when you step outside", duration: .ThirtyMin),
                             Activity(title: "Make a video of something you'd like to tell your 'future self'!", duration: .ThirtyMin),
                             Activity(title: "Learn a new type of dance (something that's foreign to where you're from)!", duration: .ThirtyMin)]
    
    
    func getShortActivityTitle() {
        for activity in Activity.shortArray {
            print(activity.title)
        }
    }
    
    // array of long activities
        
    static var longArray = [Activity(title: "Watch a movie that you've never watched before!",                  duration: .SixtyMin),
                            Activity(title: "Cook a special meal for your loved one(s)", duration: .SixtyMin),
                            Activity(title: "'Spring' cleaning time while having a dance party for 1!", duration: .SixtyMin),
                            Activity(title: "Learn the basics of how to code in iOS or Android!", duration: .SixtyMin),
                            Activity(title: "Make a scrapbook of your most memorable times!", duration: .SixtyMin),
                            Activity(title: "Try doing Zumba!", duration: .SixtyMin),
                            Activity(title: "Treat yourself to a 'Me Day'! Go spoil yourself!", duration: .SixtyMin),
                            Activity(title: "Play one of your favorite games from your childhood!", duration: .SixtyMin),
                            Activity(title: "Look up funny videos on YouTube!", duration: .SixtyMin),
                            Activity(title: "Plan the 'perfect' vacation getaway that you'd like to go on!", duration: .SixtyMin)]
    
    func getLongActivityTitle() {
        for option in Activity.longArray {
            print(option.title)
        }
    }
    
    func pickActivity(choice: Int) -> String {
                if choice == 1 {
                    let randomIndex = Int(arc4random_uniform(UInt32(Activity.shortArray.count)))
                    let removeActivity = Activity.shortArray.removeAtIndex(randomIndex)
                    return removeActivity.title
                }
                else {
                    let randomIndex2 = Int(arc4random_uniform(UInt32(Activity.longArray.count)))
                    let removeActivity2 = Activity.longArray.removeAtIndex(randomIndex2)
                    return removeActivity2.title
                    
                }
                
    }
    
}