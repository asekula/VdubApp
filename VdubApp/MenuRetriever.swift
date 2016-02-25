//
//  MenuRetriever.swift
//  VdubApp
//
//  Created by Alex on 2/24/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import Foundation
import SwiftyJSON

class MenuRetriever {
 
    var connection: MenuNSURLSession = MenuNSURLSession()
    
    init() {}
    
    // First check if it's stored in a local file.
    // If not, get from api, then store in file.
    func get(hall: Int, offset: Int) -> [[String:[String]]] {
 
        //return [ [ "poo": ["a", "b"]],[ "red": ["aa", "bb"]],[ "pereroo": ["are", "bre"]] ]
        
        let day = Date.getDayNumber(offset)
        let month = Date.getMonthNumber(offset)
 
        
        var url = "&day=\(day)&month=\(month)"
        
        switch hall {
        case 0: url = "vdub"+url
        case 1: url = "ratty"+url
        case 2: return andrews(offset)
        default: return [[:]]
        }
        
        connection.setMyQuery(url)
        connection.data_request()
        var data: [JSON] = connection.dataComplete
        
        while data.count == 0 {
            data = connection.dataComplete
        }
        
        var meals = [[String:[String]](),[String:[String]](),[String:[String]]()]
        
        for meal in 0..<meals.count {
            
            var actualmeal = meal
            if hall == 0 && meal > 0 {
                actualmeal += 1
            }
            
            let dict = data[actualmeal].dictionaryValue
            for key in dict.keys {
                let jsonMenuItems = dict[key]!.arrayValue
                var stringArr = [String]()
                for jsonVal in jsonMenuItems {
                    if let s = jsonVal.string {
                        stringArr.append(s)
                    }
                }
                if stringArr.count > 1 {
                    meals[meal][key] = stringArr
                }
            }
        }
        
        return meals
        
        /*
        
        if diningHall == 0 {
            var tempMeal = meal
            if meal > 0 {
                tempMeal += 1
            }
            let tm = MenuSingleton.sharedInstance.vdubMenu
            if tm.count == 1 {
                theMenu = ["Closed": JSON(arrayLiteral: ["closed", "a"])] // doesn't actually display closed
            } else {
                theMenu = tm[tempMeal].dictionaryValue
            }
        } else {
            let tm = MenuSingleton.sharedInstance.rattyMenu
            if Date.isWeekend(dayOffSet) && meal > 0 {
                theMenu = tm[meal-1].dictionaryValue
            }
            else {
                //print(meal)
                if meal < tm.count {
                    theMenu = tm[meal].dictionaryValue
                }
                else {
                    theMenu = [String: JSON]()
                    
                }
            }
        }
        for key in theMenu.keys {
            let jsonMenuItems = theMenu[key]!.arrayValue
            if jsonMenuItems.count > 1 {
                var stringArr = [String]()
                for jsonVal in jsonMenuItems {
                    if let s = jsonVal.string {
                        stringArr.append(s)
                    }
                }
                menu![key] = stringArr
            }
        }
*/
    }
    
    func andrews(offset: Int) -> [[String:[String]]] {
        return [[String:[String]](),[String:[String]](),[String:[String]]()]
    }
    
}