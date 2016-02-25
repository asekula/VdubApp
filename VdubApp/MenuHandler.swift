//
//  MenuHandler.swift
//  VdubApp
//
//  Created by Alex on 2/22/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import Foundation

class MenuHandler {
    
    
    var currentDiningHall: Int = 0 // 0 vdub, 1 ratty
    var currentOffset: Int = 0 //
    var currentMeal: Int = 0 // 0 bfast, 1 lunch, 2 dinner.
    var maxDaysForward: Int = 4 // currentOffset is allowed to equal maxDaysForward
    
    // First coordinate: dinin hall
    // Second: day of week. 
    // Third: meal of day.
    // Array of Array of Array of Dictionary<String, Array<String>>
    var menu = [[[[String:[String]]]]]()
    
    func switchHall(hall: Int) {
        currentDiningHall = hall
    }
    
    func back() {
        if currentOffset > 0 {
            currentOffset -= 1
        }
    }
    
    func forward() {
        if currentOffset < maxDaysForward {
            currentOffset += 1
        }
    }
    
    func canBack() -> Bool {
        return (currentOffset > 0)
    }
    
    func canForward() -> Bool {
        return (currentOffset < maxDaysForward)
    }
    
    func changeMeal(meal: Int) {
        currentMeal = meal
    }
    
    func retrieve(hall: Int, offset: Int) -> [String:[String]] {
        menu[hall][offset]
    }
    
    func numberOfKeys() -> Int {
        return Array(menu[currentDiningHall][currentOffset][currentMeal].keys).count
    }
    
    func elementsInSection(section: Int) -> Int {
        let key = Array(menu[currentDiningHall][currentOffset][currentMeal].keys)[section]
        return menu[currentDiningHall][currentOffset][currentMeal][key]!.count
    }
    
    func getItem(section: Int, row: Int) -> String {
        let key = Array(menu[currentDiningHall][currentOffset][currentMeal].keys)[section]
        return menu[currentDiningHall][currentOffset][currentMeal][key]![row]
    }
    
    func sectionTitle(section: Int) -> String {
        return Array(menu[currentDiningHall][currentOffset][currentMeal].keys)[section]
    }
    
    func dayOfWeek() -> String {
        return Date.getWeekday(currentOffset)
    }

}