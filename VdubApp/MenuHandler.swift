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
    var maxDaysForward: Int = 6 // currentOffset is allowed to equal maxDaysForward
    var menuRetriever: MenuRetriever = MenuRetriever()
    var retrievedIndex: Int = -1 // Ensures that menu has loaded days up to and including retrievedIndex.
    var loading = false
    let defaults = NSUserDefaults.standardUserDefaults()
    var allFavorites:[String:Int] = [String:Int]() // Shouldn't change. Setting to var 
    // instead of let so that it can load in the background.
    
    // First coordinate: dining hall
    // Second: day of week. 
    // Third: meal of day.
    // 3D array contains Dictionary<String, Array<String>>
    var menu : [[[[String:[String]]]]]
    
    init() {
        let emptyDict = [String:[String]]()
        let meals = [[String: [String]]](count: 3, repeatedValue: emptyDict)
        let days = [[[String:[String]]]](count: maxDaysForward + 1, repeatedValue: meals)
        
        menu = [[[[String:[String]]]]](count: 3, repeatedValue: days)
    }
    
    
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
        return (currentOffset < maxDaysForward) && (currentOffset < retrievedIndex)
    }
    
    func changeMeal(meal: Int) {
        currentMeal = meal
    }
    
    func retrieveData() {
        if retrievedIndex < maxDaysForward && !loading {
            var noInternet = false
            loading = true
            for hall in 0..<menu.count {
                menu[hall][retrievedIndex + 1] = menuRetriever.get(hall, offset: (retrievedIndex + 1))
                if Array(menu[hall][retrievedIndex + 1][0].keys)[0] == MenuRetriever.noInternetMessage {
                    noInternet = true
                }
            }
            if noInternet {
                print("couldn't load \(retrievedIndex+1)")
            } else {
                retrievedIndex += 1
                print("loaded \(retrievedIndex)")
            }
            loading = false
        }
        if loading {
            print("letting other thread finish")
        }
    }
    
    func retrieveFavorites() {
        //allFavorites["caprese"] = 100 // HERE IS WHERE YOU INITIALIZE ALLFAVORITES
    }
    
    func pushFavoritesChanges() {
        // send changes to database
    }
    
    func howFavorite(food: String) -> Int {
        var change = 0, amount = 0
        if let c = ChangesSingleton.changes[food] {
            change = c
        }
        
        if let a = allFavorites[food] {
            amount = a
        }
        return change + amount
    }
    
    func isFavorite(food: String) -> Bool {
        if let favorites = defaults.objectForKey("favorite foods") as? [String] {
            return favorites.contains(food)
        }
        return false
    }
    
    func addFavorite(food: String) {
        if isErrorMessage(food) { return }
        
        if !isFavorite(food) {
            if var favorites = defaults.objectForKey("favorite foods") as? [String] {
                favorites.append(food) // make sure this actually changes the user defaults
                defaults.setObject(favorites, forKey: "favorite foods")
                defaults.synchronize()
            } else {
                defaults.setObject([food], forKey: "favorite foods")
                defaults.synchronize()
            }
            if ChangesSingleton.changes[food] == nil {
                ChangesSingleton.changes[food] = 1
            } else {
                ChangesSingleton.changes[food]! += 1
            }
            print(ChangesSingleton.changes[food])
            
        } else {
            // Edits the nsuserdefaults array.
            if var favorites = defaults.objectForKey("favorite foods") as? [String] {
                // make sure this actually changes the user defaults
                favorites = favorites.filter { $0 != food }
                defaults.setObject(favorites, forKey: "favorite foods")
                defaults.synchronize()
            }
            
            //Edits the changes array for the database.
            if ChangesSingleton.changes[food] == nil {
                ChangesSingleton.changes[food] = -1
            } else {
                ChangesSingleton.changes[food]! -= 1
            }
        }
    }
    
    func isErrorMessage(message: String) -> Bool {
        if message == AndrewsMenu.AndrewsClosed || message == MenuRetriever.unableToLoad || message == MenuRetriever.noInternetValue || message == MenuRetriever.VDubClosed {
            return true
        }
        return false
    }
    
    
    // None of these handles edge cases, put these in later.
    // Unless these should be kept bare to check for bugs. 
    // The exceptions would be unwanted exceptions, after all.

    func numberOfKeys() -> Int {
        return Array(menu[currentDiningHall][currentOffset][currentMeal].keys).count
    }
    
    func elementsInSection(section: Int) -> Int {
        let key = Array(menu[currentDiningHall][currentOffset][currentMeal].keys).sort(isOrderedBefore)[section]
        return menu[currentDiningHall][currentOffset][currentMeal][key]!.count
    }
    
    func getItem(section: Int, row: Int) -> String {
        let key = Array(menu[currentDiningHall][currentOffset][currentMeal].keys).sort(isOrderedBefore)[section]
        return menu[currentDiningHall][currentOffset][currentMeal][key]![row]
    }
    
    func sectionTitle(section: Int) -> String {
        return Array(menu[currentDiningHall][currentOffset][currentMeal].keys).sort(isOrderedBefore)[section]
    }
    
    func dayOfWeek() -> String {
        return Date.getWeekday(currentOffset)
    }

    func isOrderedBefore(s: String, t:String) -> Bool {
        var ind1: Int, ind2: Int
        let vdub = ["main menu", "daily sidebars"]
        let ratty = ["bistro", "chef's corner", "grill", "roots & shoots", "daily sidebars"]
        let andrews = ["brunch", "special", "pizza", "pasta", "wok", "daily"]
        
        if vdub.contains(s) && vdub.contains(t) {
            ind1 = vdub.indexOf(s)!
            ind2 = vdub.indexOf(t)!
        } else if ratty.contains(s) && ratty.contains(t) {
            ind1 = ratty.indexOf(s)!
            ind2 = ratty.indexOf(t)!
        } else if andrews.contains(s) && andrews.contains(t) {
            ind1 = andrews.indexOf(s)!
            ind2 = andrews.indexOf(t)!
        } else {
            return s < t
        }
        return ind1 < ind2
    }
}