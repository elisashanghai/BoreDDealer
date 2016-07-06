//
//  ActivityHelper.swift
//  BoreDDealer
//
//  Created by Brittiny Tran on 7/6/16.
//  Copyright © 2016 WhenYouBored. All rights reserved.
//

import Foundation

struct Activity {
    var list30Min = ["Read a new book!", "Make a bucket list of 20 things you want to do before you die!", "Start a watching a new TV series!", "Bake something!", "Write a letter for someone you care about", "Go biking in a park nearby you", "Take a 30 minute nap and feel refreshed!", "Learn about a sport that's popular in another country besides the one you reside in!", "Make a drawing of the first thing you see when you step outside", "Make a video of something you'd like to tell your 'future self'!","Learn a new type of dance! (something that's foreign to where you're from!)"]
    
    var listHour = ["Watch a movie that you've never watched before!", "Cook a special meal for your loved one(s)!", "'Spring' cleaning time while having a dance party for 1!", "Learn the basics of how to code in iOS or Android!", "Make a scrapbook of your most memorable times!", "Try doing Zumba!", "Treat yourself to a 'Me Day'! Go spoil yourself!", "Play one of your favorite games from your childhood!", "Roll up your extra change and come up with a creative way to spend it! It doesn't matter how litte you have!", "Plan the 'perfect' vacation getaway that you'd like to go on!"]

    init(list30: list30Min, list1Hr: listHour) {
        self.list30 = list30
        self.list1Hr = list1Hr
    }

}

class Activity {
    var activityFor30 = [list30Min]()
    var activityForHour = [listHour]()
    
}