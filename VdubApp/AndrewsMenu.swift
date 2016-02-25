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
        let wok:[String]
        
        print(Date.getWeekday(offset))
        
        if Date.getWeekday(offset) == "Monday" {
            if Date.wokCycle(offset) == 1 {
                wok = ["Lemongrass", "Jasmine Rice",
                    "Quinoa",
                    "Teriyaki Chicken",
                    "Vegetable Lo Mein",
                    "Yellow Jungle Curry",
                    "Basil Pork with Onions and Garlic",
                    "Kerala Green Beans"]
            } else {
                wok = ["Lemongrass",
                    "Jasmine Rice",
                    "Quinoa",
                    "Lemonrass Chicken",
                    "Vegetable Lo Mein",
                    "Yellow Jungle Curry",
                    "Sriracha Chicken Tempura",
                    "Green Beans with Garlic",
                    "Fried Rice Station"]
            }
            
            lunch = [ "Pizza": ["Rhode to Italy", "Caprese", "BBQ Chicken Ranch"],
                "Pasta": ["Chicken Parmesan", "Jalapeno Mac & Cheese"],
                "Special": ["Grinder Station", "Pho", "Spinach and Feta Puff Pocket", "Cookie Slice", "Brownie Slice"] ]
            dinner = [ "Wok": wok,
                "Pizza": ["Rhode to Italy", "Caprese", "BBQ Chicken Ranch"],
                "Pasta": ["Chicken Parmesan", "Jalapeno Mac & Cheese"],
                "Special": ["Chili Bar", "Fried Rice Station", "Make your own Panini", "Spinach and Feta Puff Pocket", "Cookie Slice", "Brownie Slice"] ]
        }
        else if Date.getWeekday(offset) == "Tuesday" {
            var wok:[String] = []
            if Date.wokCycle(offset) == 1 {
                wok = ["Lemongrass", "Jasmine Rice",
                    "Quinoa",
                    "Teriyaki Chicken",
                    "Vegetable Lo Mein",
                    "Yellow Jungle Curry",
                    "Basil Pork with Onions and Garlic",
                    "Kerala Green Beans"]
            } else {
                wok = ["Lemongrass",
                    "Jasmine Rice",
                    "Quinoa",
                    "Lemonrass Chicken",
                    "Vegetable Lo Mein",
                    "Yellow Jungle Curry",
                    "Sriracha Chicken Tempura",
                    "Green Beans with Garlic",
                    "Fried Rice Station"]
            }
            
            lunch = [ "Pizza": ["Bacon Chicken Ranch", "Spinach & Feta", "Pepperoni & Meatball"],
                "Pasta": ["Meatball", "Mac & Cheese"],
                "Special": ["Grinder Station", "Pho", "Italian Puff Pocket", "Cookie Slice", "Brownie Slice"] ]
            dinner = [ "Wok": wok,
                "Pizza": ["Bacon Chicken Ranch", "Spinach & Feta", "Pepperoni & Meatball"],
                "Pasta": ["Meatball", "Mac & Cheese"],
                "Special": ["Chipotle BBQ Taco", "Make your own Panini", "Italian Puff Pocket", "Cookie Slice", "Brownie Slice"] ]
        }
        else if Date.getWeekday(offset) == "Wednesday" {
            var wok:[String] = []
            if Date.wokCycle(offset) == 1 {
                wok = ["Lemongrass", "Jasmine Rice",
                    "Quinoa",
                    "Teriyaki Chicken",
                    "Vegetable Lo Mein",
                    "Yellow Jungle Curry",
                    "Basil Pork with Onions and Garlic",
                    "Kerala Green Beans"]
            } else {
                wok = ["Lemongrass",
                    "Jasmine Rice",
                    "Quinoa",
                    "Lemonrass Chicken",
                    "Vegetable Lo Mein",
                    "Yellow Jungle Curry",
                    "Sriracha Chicken Tempura",
                    "Green Beans with Garlic",
                    "Fried Rice Station"]
            }
            lunch = [ "Pizza": ["Honey Boo Boo", "Mushroom's Revenge", "Sausage & spicy garlic"],
                "Pasta": ["Carbonara", "Pesto & Sundried Tomato"],
                "Special": ["Grinder Station", "Pho", "Buffalo Chicken Puff Pocket", "Cookie Slice", "Brownie Slice"] ]
            dinner = [ "Wok": wok,
                "Pizza": ["Honey Boo Boo", "Mushroom's Revenge", "Sausage & spicy garlic"],
                "Pasta": ["Carbonara", "Pesto & Sundried Tomato"],
                "Special": ["Po' Boys/Rich Boys", "Make your own Panini", "Buffalo Chicken Puff Pocket", "Cookie Slice", "Brownie Slice"] ]
        }
        else if Date.getWeekday(offset) == "Thursday" {
            var wok:[String] = []
            if Date.wokCycle(offset) == 1 {
                wok = ["Lemongrass", "Jasmine Rice",
                    "Quinoa",
                    "Teriyaki Chicken",
                    "Vegetable Lo Mein",
                    "Yellow Jungle Curry",
                    "Basil Pork with Onions and Garlic",
                    "Kerala Green Beans"]
            } else {
                wok = ["Lemongrass",
                    "Jasmine Rice",
                    "Quinoa",
                    "Lemonrass Chicken",
                    "Vegetable Lo Mein",
                    "Yellow Jungle Curry",
                    "Sriracha Chicken Tempura",
                    "Green Beans with Garlic",
                    "Fried Rice Station"]
            }
            lunch = [ "Pizza": ["Na'cho Pizza", "Spicy 5 Cheese & Garlic", "BBQ Bam Bam"],
                "Special": ["Grinder Station", "Pho", "Spinach and Feta Puff Pocket", "Cookie Slice", "Brownie Slice", "add Ice Cream and Sundae toppings"] ]
            dinner = [ "Wok": wok,
                "Pizza": ["Na'cho Pizza", "Spicy 5 Cheese & Garlic", "BBQ Bam Bam"],
                "Special": ["Make your own Pasta Station", "Make your own Panini", "Spinach and Feta Puff Pocket", "Cookie Slice", "Brownie Slice", "add Ice Cream and Sundae toppings"] ]
        }
        else if Date.getWeekday(offset) == "Friday" {
            var wok:[String] = []
            if Date.wokCycle(offset) == 1 {
                wok = ["Lemongrass", "Jasmine Rice",
                    "Quinoa",
                    "Teriyaki Chicken",
                    "Vegetable Lo Mein",
                    "Yellow Jungle Curry",
                    "Basil Pork with Onions and Garlic",
                    "Kerala Green Beans"]
            } else {
                wok = ["Lemongrass",
                    "Jasmine Rice",
                    "Quinoa",
                    "Lemonrass Chicken",
                    "Vegetable Lo Mein",
                    "Yellow Jungle Curry",
                    "Sriracha Chicken Tempura",
                    "Green Beans with Garlic",
                    "Fried Rice Station"]
            }
            lunch = [ "Pizza": ["Bacon & Feta", "Harvest", "Buffalo Chicken"],
                "Pasta": ["Cajun chicken", "Wild Mushroom & Gorgonzola"],
                "Special": ["Grinder Station", "Pho", "Italian Puff Pocket", "Cookie Slice", "Brownie Slice"] ]
            dinner = [ "Wok": wok,
                "Pizza": ["Bacon & Feta", "Harvest", "Buffalo Chicken"],
                "Pasta": ["Cajun chicken", "Wild Mushroom & Gorgonzola"],
                "Special": ["BBQ Pulled Pork Sandwich", "Make your own Panini", "Italian Puff Pocket", "Cookie Slice", "Brownie Slice"] ]
        }
        else if Date.getWeekday(offset) == "Saturday" {
            var wok:[String] = []
            if Date.wokCycle(offset) == 1 {
                wok = ["Lemongrass", "Jasmine Rice",
                    "Quinoa",
                    "Teriyaki Chicken",
                    "Vegetable Lo Mein",
                    "Yellow Jungle Curry",
                    "Basil Pork with Onions and Garlic",
                    "Kerala Green Beans"]
            } else {
                wok = ["Lemongrass",
                    "Jasmine Rice",
                    "Quinoa",
                    "Lemonrass Chicken",
                    "Vegetable Lo Mein",
                    "Yellow Jungle Curry",
                    "Sriracha Chicken Tempura",
                    "Green Beans with Garlic",
                    "Fried Rice Station"]
            }
            lunch = [ "Pizza": ["Bacon Alfredo", "Pizza Bianco", "Pepperoni & Sausage & Jalapeno"],
                "Pasta": ["Bacon Mac", "Mac & Cheese"],
                "Brunch": ["Granola Bowl", "Pho", "Breakfast Burrito", "Breakfast Sandwich", "Biscuit Bites", "Cookie Slice", "Brownie Slice"] ]
            dinner = [ "Wok": wok,
                "Pizza": ["Bacon Alfredo", "Pizza Bianco", "Pepperoni & Sausage & Jalapeno"],
                "Pasta": ["Bacon Mac", "Mac & Cheese"],
                "Special": ["Asian Tacos", "Make your own Panini", "Biscuit Bites", "Cookie Slice", "Brownie Slice"] ]
        }
            
        else if Date.getWeekday(offset) == "Sunday" {
            var wok:[String] = []
            if Date.wokCycle(offset) == 1 {
                wok = ["Lemongrass", "Jasmine Rice",
                    "Quinoa",
                    "Teriyaki Chicken",
                    "Vegetable Lo Mein",
                    "Yellow Jungle Curry",
                    "Basil Pork with Onions and Garlic",
                    "Kerala Green Beans"]
            } else {
                wok = ["Lemongrass",
                    "Jasmine Rice",
                    "Quinoa",
                    "Lemonrass Chicken",
                    "Vegetable Lo Mein",
                    "Yellow Jungle Curry",
                    "Sriracha Chicken Tempura",
                    "Green Beans with Garlic",
                    "Fried Rice Station"]
            }
            lunch = [ "Pizza": ["Chipotle BBQ Sausage", "Southwest Veggie", "Upside Down Margherita"],
                "Pasta": ["Chicken w/Pink Vodka", "Pesto & Sundried Tomato"],
                "Brunch": ["Granola Bowl", "Pho", "Breakfast Burrito", "Breakfast Sandwich", "Buffalo Chicken Puff Pocket", "Cookie Slice", "Brownie Slice"] ]
            dinner = [ "Wok": wok,
                "Pizza": ["Chipotle BBQ Sausage", "Southwest Veggie", "Upside Down Margherita"],
                "Pasta": ["Chicken w/Pink Vodka", "Pesto & Sundried Tomato"],
                "Special": ["Bahn Mi", "Make your own Panini", "Buffalo Chicken Puff Pocket", "Cookie Slice", "Brownie Slice"] ]
        }
        else {
            lunch = [:]
            dinner = [:]
        }
        print(lunch)
        return [[:], lunch, dinner]
        
    }

}