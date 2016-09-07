//
//  AndrewsMenu.swift
//  VdubApp
//
//  Created by Alex on 2/24/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import Foundation

// Maybe we shouldn't hard code this.
// Someone has to though.
class AndrewsMenu {
    
    static let AndrewsClosed = "Andrews Commons opens at 11am."
    static let IsSummer = true
    
    static func menu(offset: Int) -> [[String:[String]]] {
        
        let closedForSummer = ["Not this season": ["Andrews is closed for the summer."]]
        if IsSummer {
            return [closedForSummer, closedForSummer, closedForSummer]
        }
            
        let lunch:[String:[String]]
        let dinner:[String:[String]]
        var wok = [String]()
        let weekday = Date.getWeekday(offset)
        let dailyLunch = ["grinder", "pho", "cookie slice", "brownie slice"]
        let dailyDinner = ["make your own panini", "cookie slice", "brownie slice"]
        let pizza:[String], pasta:[String]
        var special = [String]()
        var brunch = [String]()
        let bfast = ["You'll have to wait": [AndrewsMenu.AndrewsClosed]]
        
        
        if weekday == "Monday" {
            if Date.wokCycle(offset) == 1 {
                wok = ["jasmine rice",
                    "quinoa",
                    "teriyaki chicken",
                    "vegetable lo mein",
                    "yellow jungle curry",
                    "basil pork with onions and garlic",
                    "kerala green beans"]
            } else {
                wok = [
                    "jasmine rice",
                    "quinoa",
                    "lemongrass chicken",
                    "vegetable lo mein ",
                    "yellow jungle curry",
                    "sriracha chicken tempura",
                    "green beans with garlic"]
            }
            
            pizza = ["rhode to italy", "caprese", "bbq chicken ranch", "spinach and feta puff pocket"]
            pasta = ["chicken parmesan", "jalapeno mac & cheese"]
            special = ["chili bar", "fried rice station"]
        }
        else if weekday == "Tuesday" {
            if Date.wokCycle(offset) == 1 {
                wok = [
                    "jasmine rice",
                    "quinoa",
                    "teriyaki chicken",
                    "vegetable lo mein",
                    "toor dal lentil curry",
                    "beef and broccoli",
                    "stir fried zucchini and yellow squash"]
            } else {
                wok = [
                    "jasmine rice",
                    "quinoa",
                    "lemongrass chicken",
                    "vegetable lo mein ",
                    "tofu and butternut yellow curry",
                    "mongolian beef",
                    "stir fried broccoli"]
            }
            
            pizza = ["bacon chicken ranch", "spinach & feta", "pepperoni & meatball", "italian puff pocket"]
            pasta = ["meatball", "mac & cheese"]
            special = ["chipotle bbq taco"]
        }
        else if weekday == "Wednesday" {
            if Date.wokCycle(offset) == 1 {
                wok = ["jasmine rice",
                    "brown rice",
                    "carved orange-chili pork tenderloin",
                    "vegetable lo mein",
                    "green curry chicken with zucchini",
                    "corey's chili chicken",
                    "asian greens with garlic"]
            } else {
                wok = ["jasmine rice",
                    "brown rice",
                    "thai bbq chicken",
                    "vegetable lo mein ",
                    "red curry pork with sweet potatoes and green beans",
                    "general tso chicken",
                    "tofu and eggplant stir fry"]
            }
            pizza = ["honey boo boo", "mushroom's revenge", "sausage & spicy garlic", "buffalo chicken puff pocket"]
            pasta = ["carbonara", "pesto & sundried tomato"]
            special = ["po' boys/rich boys"]
        }
        else if weekday == "Thursday" {
            if Date.wokCycle(offset) == 1 {
                wok = ["jasmine rice",
                    "brown rice",
                    "thai bbq chicken",
                    "vegetable lo mein",
                    "devil's chicken curry",
                    "sweet and sour pork",
                    "tofu and vegetable stir fry"]
            } else {
                wok = [
                    "jasmine rice",
                    "quinoa",
                    "thai bbq chicken",
                    "vegetable lo mein ",
                    "vegetable yellow curry of the day",
                    "vietnamese basil chicken stir fry",
                    "spice market cauliflower"]
            }
            pizza = ["na'cho pizza", "spicy 5 cheese & garlic", "bbq bam bam", "spinach and feta puff pocket"]
            pasta = []
            special = ["make your own pasta station", "sundae slice bar"]
            
            lunch = ["pizza": pizza, "daily": dailyLunch]
            dinner = ["special": special,
                "pizza": pizza,
                "wok": wok,
                "daily": dailyDinner]
            return [bfast, lunch, dinner]
        }
        else if weekday == "Friday" {
            if Date.wokCycle(offset) == 1 {
                wok = ["jasmine rice",
                    "quinoa",
                    "thai bbq chicken",
                    "vegetable lo mein",
                    "red curry pork and potatoes",
                    "chicken dumplings with vegetables in garlic sauce",
                    "snap peas with mushrooms and tofu"]
            } else {
                wok = [
                    "jasmine rice",
                    "brown rice",
                    "thai bbq chicken",
                    "vegetable lo mein ",
                    "shrimp green curry with vegetables",
                    "carved lemongrass pork tenderloin",
                    "stir fried snap peas w/ red bell pepper and tofu"]
            }
            pizza = ["bacon & feta", "harvest", "buffalo chicken", "italian puff pocket"]
            pasta = ["cajun chicken", "wild mushroom & gorgonzola"]
            special = ["bbq pulled pork sandwich"]
        }
        else if weekday == "Saturday" {
            if Date.wokCycle(offset) == 1 {
                wok = ["jasmine rice",
                    "brown rice",
                    "thai bbq chicken",
                    "vegetable lo mein ",
                    "mushroom and squash yellow curry",
                    "teriyaki salmon",
                    "gingered carrots"]
            } else {
                wok = [
                    "jasmine rice",
                    "brown rice",
                    "thai bbq chicken",
                    "vegetable lo mein ",
                    "broccoli and tofu yellow curry",
                    "haddock with soy mushroom broth",
                    "asian greens with garlic"]
            }
            pizza = ["bacon alfredo", "pizza bianco", "pepperoni & sausage & jalapeno", "biscuit bites"] // pizza only for dinner.
            pasta = ["bacon mac", "mac & cheese"]
            brunch = ["granola bowl", "pho", "breakfast burrito", "breakfast sandwich"] // use brunch instead of dailyLunch
            special = ["asian tacos"] // still use dailyDinner
            
            lunch = ["brunch": brunch]
            dinner = ["special": special,
                "pizza": pizza,
                "pasta": pasta,
                "wok": wok,
                "daily": dailyDinner]
            return [bfast, lunch, dinner]
        }
            
        else if weekday == "Sunday" {
            if Date.wokCycle(offset) == 1 {
                wok = ["jasmine rice",
                    "brown rice",
                    "teriyaki chicken",
                    "vegetable lo mein ",
                    "green curry haddock and butternut squash",
                    "beef rendang",
                    "stir fried broccoli with tofu"]
            } else {
                wok = [
                    "jasmine rice",
                    "brown rice",
                    "lemongrass chicken",
                    "vegetable lo mein ",
                    "red curry chicken and sweet potatoes",
                    "shrimp and scallops with vegetables in a garlic sauce ",
                    "bok choy with mushrooms"]
            }
            pizza = ["chipotle bbq sausage", "southwest veggie", "upside down margherita", "buffalo chicken puff pocket"]
            pasta = ["chicken w/pink vodka", "pesto & sundried tomato"]
            brunch = ["granola bowl", "pho", "breakfast burrito", "breakfast sandwich"]
            special = ["bahn mi"]
            
            lunch = ["brunch": brunch]
            dinner = ["special": special,
                "pizza": pizza,
                "pasta": pasta,
                "wok": wok,
                "daily": dailyDinner]
            return [bfast, lunch, dinner]
        }
        else {
            pizza = []
            pasta = []
        }
        lunch = ["pizza": pizza, "pasta": pasta, "daily": dailyLunch]
        dinner = ["special": special,
            "pizza": pizza,
            "pasta": pasta,
            "wok": wok,
            "daily": dailyDinner]
        return [bfast, lunch, dinner]
        
    }
}