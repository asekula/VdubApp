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
    
    func switchHall(hall: Int) {
        
    }
    
    func back() {
    
    }
    
    func forward() {
    
    }
    
    func canBack() -> Bool {
        return true
    }
    
    func canForward() -> Bool {
        return true
    }
    
    func changeMeal(meal: Int) {
        
    }
    
    func getMenu() -> Int {
        return 0
    }
    
    func numberOfKeys() -> Int {
        return 2
    }
    
    func elementsInSection(section: Int) -> Int {
        return 3
    }
    
    func getItem(section: Int, row: Int) -> String {
        return "a"
    }
    
    func sectionTitle(section: Int) -> String {
        return "b"
    }
    
    func dayOfWeek() -> String {
        return "asdf"
    }

}