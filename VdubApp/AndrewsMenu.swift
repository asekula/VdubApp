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
    static func menu(offset: Int) -> [[String:[String]]] {
        let lunch:[String:[String]]
        let dinner:[String:[String]]
        var wok = [String]()
        let weekday = Date.getWeekday(offset)
        let dailyLunch = ["grinder", "pho", "cookie slice", "brownie slice"]
        let dailyDinner = ["make your own panini", "cookie slice", "brownie slice"]
        let pizza:[String], pasta:[String]
        var special = [String]()
        var brunch = [String]()
        
        /*
        Organize:
        1. special (day specific)
        2. pizza - puff pocket too, cause where else.
        3. pasta
        4. wok
        5. daily food (cookie/brownie/panini)
        */
        
        
        if weekday == "Monday" {
            if Date.wokCycle(offset) == 1 {
                wok = ["lemongrass", "jasmine rice",
                    "quinoa",
                    "teriyaki chicken",
                    "vegetable lo mein",
                    "yellow jungle curry",
                    "basil pork with onions and garlic",
                    "kerala green beans"]
            } else {
                wok = ["lemongrass",
                    "jasmine rice",
                    "quinoa",
                    "lemonrass chicken",
                    "vegetable lo mein",
                    "yellow jungle curry",
                    "sriracha chicken tempura",
                    "green beans with garlic",
                    "fried rice station"]
            }
            
            pizza = ["rhode to italy", "caprese", "bbq chicken ranch", "spinach and feta puff pocket"]
            pasta = ["chicken parmesan", "jalapeno mac & cheese"]
            special = ["chili bar", "fried rice station"]
        }
        else if weekday == "Tuesday" {
            if Date.wokCycle(offset) == 1 {
                wok = ["lemongrass", "jasmine rice",
                    "quinoa",
                    "teriyaki chicken",
                    "vegetable lo mein",
                    "yellow jungle curry",
                    "basil pork with onions and garlic",
                    "kerala green beans"]
            } else {
                wok = ["lemongrass",
                    "jasmine rice",
                    "quinoa",
                    "lemonrass chicken",
                    "vegetable lo mein",
                    "yellow jungle curry",
                    "sriracha chicken tempura",
                    "green beans with garlic",
                    "fried rice station"]
            }
            
            pizza = ["bacon chicken ranch", "spinach & feta", "pepperoni & meatball", "italian puff pocket"]
            pasta = ["meatball", "mac & cheese"]
            special = ["chipotle bbq taco"]
        }
        else if weekday == "Wednesday" {
            if Date.wokCycle(offset) == 1 {
                wok = ["lemongrass", "jasmine rice",
                    "quinoa",
                    "teriyaki chicken",
                    "vegetable lo mein",
                    "yellow jungle curry",
                    "basil pork with onions and garlic",
                    "kerala green beans"]
            } else {
                wok = ["lemongrass",
                    "jasmine rice",
                    "quinoa",
                    "lemonrass chicken",
                    "vegetable lo mein",
                    "yellow jungle curry",
                    "sriracha chicken tempura",
                    "green beans with garlic",
                    "fried rice station"]
            }
            pizza = ["honey boo boo", "mushroom's revenge", "sausage & spicy garlic", "buffalo chicken puff pocket"]
            pasta = ["carbonara", "pesto & sundried tomato"]
            special = ["po' boys/rich boys"]
        }
        else if weekday == "Thursday" {
            if Date.wokCycle(offset) == 1 {
                wok = ["lemongrass", "jasmine rice",
                    "quinoa",
                    "teriyaki chicken",
                    "vegetable lo mein",
                    "yellow jungle curry",
                    "basil pork with onions and garlic",
                    "kerala green beans"]
            } else {
                wok = ["lemongrass",
                    "jasmine rice",
                    "quinoa",
                    "lemonrass chicken",
                    "vegetable lo mein",
                    "yellow jungle curry",
                    "sriracha chicken tempura",
                    "green beans with garlic",
                    "fried rice station"]
            }
            pizza = ["na'cho pizza", "spicy 5 cheese & garlic", "bbq bam bam", "spinach and feta puff pocket"]
            pasta = []
            special = ["make your own pasta station", "add ice cream and sundae toppings"]
            
            lunch = ["pizza": pizza, "daily": dailyLunch]
            dinner = ["special": special,
                "pizza": pizza,
                "wok": wok,
                "daily": dailyDinner]
            return [[:], lunch, dinner]
        }
        else if weekday == "Friday" {
            if Date.wokCycle(offset) == 1 {
                wok = ["lemongrass", "jasmine rice",
                    "quinoa",
                    "teriyaki chicken",
                    "vegetable lo mein",
                    "yellow jungle curry",
                    "basil pork with onions and garlic",
                    "kerala green beans"]
            } else {
                wok = ["lemongrass",
                    "jasmine rice",
                    "quinoa",
                    "lemonrass chicken",
                    "vegetable lo mein",
                    "yellow jungle curry",
                    "sriracha chicken tempura",
                    "green beans with garlic",
                    "fried rice station"]
            }
            pizza = ["bacon & feta", "harvest", "buffalo chicken", "italian puff pocket"]
            pasta = ["cajun chicken", "wild mushroom & gorgonzola"]
            special = ["bbq pulled pork sandwich"]
        }
        else if weekday == "Saturday" {
            if Date.wokCycle(offset) == 1 {
                wok = ["lemongrass", "jasmine rice",
                    "quinoa",
                    "teriyaki chicken",
                    "vegetable lo mein",
                    "yellow jungle curry",
                    "basil pork with onions and garlic",
                    "kerala green beans"]
            } else {
                wok = ["lemongrass",
                    "jasmine rice",
                    "quinoa",
                    "lemonrass chicken",
                    "vegetable lo mein",
                    "yellow jungle curry",
                    "sriracha chicken tempura",
                    "green beans with garlic",
                    "fried rice station"]
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
            return [[:], lunch, dinner]
        }
            
        else if weekday == "Sunday" {
            if Date.wokCycle(offset) == 1 {
                wok = ["lemongrass", "jasmine rice",
                    "quinoa",
                    "teriyaki chicken",
                    "vegetable lo mein",
                    "yellow jungle curry",
                    "basil pork with onions and garlic",
                    "kerala green beans"]
            } else {
                wok = ["lemongrass",
                    "jasmine rice",
                    "quinoa",
                    "lemonrass chicken",
                    "vegetable lo mein",
                    "yellow jungle curry",
                    "sriracha chicken tempura",
                    "green beans with garlic",
                    "fried rice station"]
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
            return [[:], lunch, dinner]
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
        return [[:], lunch, dinner]
        
    }
}