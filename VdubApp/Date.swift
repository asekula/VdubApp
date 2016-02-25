//
//  Date.swift
//  VdubApp
//
//  Created by Alex on 2/22/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import Foundation

class Date {
    
    static func isWeekend(offset: Int) -> Bool {
        let calendar = NSCalendar.currentCalendar()
        let newDate = calendar.dateByAddingUnit(.Day, value: offset, toDate: NSDate(), options: [])
        return calendar.isDateInWeekend(newDate!)
    }
    
    // Not used yet, can probably ditch.
    static func getDate(offset: Int) -> String {
        let today = NSDate()
        let newdate = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: offset,
            toDate: today,
            options: NSCalendarOptions(rawValue: 0))
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        formatter.timeStyle = .MediumStyle
        
        let dateString = formatter.stringFromDate(newdate!)
        let fullNameArr = dateString.characters.split{$0 == ","}.map(String.init)
        
        let myComponents = NSCalendar.currentCalendar().components(.Weekday, fromDate: newdate!)
        let weekDay = myComponents.weekday
        var days = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]

        return("\(days[weekDay]), "+fullNameArr[0])
    }
    
    static func getHour() -> Int {
        return NSCalendar.currentCalendar().component(.Hour, fromDate: NSDate())
    }
    
    static func getWeekday(offset: Int) -> String {
        let today = NSDate()
        let newdate = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: offset,
            toDate: today,
            options: NSCalendarOptions(rawValue: 0))
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        formatter.timeStyle = .MediumStyle
        
        let myComponents = NSCalendar.currentCalendar().components(.Weekday, fromDate: newdate!)
        let weekDay = myComponents.weekday
        var days = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
        
        return days[weekDay-1]
    }
    
    static func getDayNumber(offset: Int) -> Int {
        let newdate = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: offset,
            toDate: NSDate(),
            options: NSCalendarOptions(rawValue: 0))
        let myComponents = NSCalendar.currentCalendar().components(.Day, fromDate: newdate!)
        return myComponents.day
    }
    
    static func getMonthNumber(offset: Int) -> Int {
        let newdate = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: offset,
            toDate: NSDate(),
            options: NSCalendarOptions(rawValue: 0))
        let myComponents = NSCalendar.currentCalendar().components(.Month, fromDate: newdate!)
        return myComponents.month
    }
    
    // Change this.
    static func wokCycle(offset: Int) -> Int {
        return 1
    }
}
