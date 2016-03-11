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
 
    static let VDubClosed = "The Vdub is closed today."
    static let noInternetValue = "You need the internet."
    static let unableToLoad = "Unable to load data."
    
    static var noInternetMessage = "Where is the internet?"
    var connection: ApiNSURLSession = ApiNSURLSession()
    
    init() {}
    
    // First check if it's stored in a local file.
    // If not, get from api, then store in file.
    func get(hall: Int, offset: Int) -> [[String:[String]]] {
        
        if !Reachability.isConnectedToNetwork() {
            let closedMsg = [MenuRetriever.noInternetMessage : [MenuRetriever.noInternetValue]]
            return [closedMsg, closedMsg, closedMsg]
        }
        
        let day = Date.getDayNumber(offset)
        let month = Date.getMonthNumber(offset)
 
        var url = "&day=\(day)&month=\(month)"
        
        switch hall {
        case 0:
            url = "vdub"+url
            if Date.isWeekend(offset) {
                let closedMsg = ["Bummer":[MenuRetriever.VDubClosed]]
                return [closedMsg,closedMsg,closedMsg]
            }
        case 1: url = "ratty"+url
        case 2: return AndrewsMenu.menu(offset)
        default: return [[:]]
        }
        
        connection.setMyQuery(url)
        connection.data_request()
        var data: [JSON] = connection.dataComplete
        
        while data.count == 0 {
            data = connection.dataComplete // SHOULDN'T RUN IF CONNECTION RETURNS "ERROR"
        }
        
        if data.count == 1 {
            let errorMsg = ["Whoops": [MenuRetriever.unableToLoad]]
            return [errorMsg, errorMsg, errorMsg]
        }
        
        var meals = [[String:[String]](),[String:[String]](),[String:[String]]()]
        
        var bfastdict = [String:[String]]()
        var lunchdict = [String:[String]]()
        var dinnerdict = [String:[String]]()
        
        
        /*var modifiedData: [JSON] = data
        if modifiedData.count == 3 {
            modifiedData.append([])
            modifiedData[2] = data[0]
            modifiedData[3] = data[1]
            modifiedData[0] = data[2]
        }*/
        //modifiedData.insert([], atIndex: 0)
        
        for meal in 0..<data.count { // data.count: number of meals returned
            /*
            var actualmeal = meal
            if hall == 0 && meal > 0 {
                actualmeal += 1
            }
            if hall == 1 && Date.getWeekday(offset) == "Sunday" && meal > 0 {
                actualmeal = meal - 1
            }
            
            if actualmeal == data.count {
                print(data)
            } */

            var breakfast = false, lunch = false, dinner = false
            
            var tempdict = [String:[String]]()
            
            //print("\(actualmeal) accessing \(data.count) for \(hall)")
            let dict = data[meal].dictionaryValue
            for key in dict.keys {
                let jsonMenuItems = dict[key]!.arrayValue
                var stringArr = [String]()
                for jsonVal in jsonMenuItems {
                    if let s = jsonVal.string {
                        stringArr.append(s)
                    }
                }
                
                if key == "meal" {
                    if let truemeal = dict[key]!.string {
                        if truemeal == "breakfast" {
                            breakfast = true
                        } else if truemeal == "lunch" {
                            lunch = true
                        } else if truemeal == "dinner" {
                            dinner = true
                        } else if truemeal == "brunch" {
                            print("BRUNCH")
                            breakfast = true
                            lunch = true
                        }
                    }
                }
                
                if stringArr.count > 1 {
                    tempdict[key] = stringArr
                }
            }
            if breakfast {
                bfastdict = tempdict
            }
            else if lunch {
                lunchdict = tempdict
            } else if dinner {
                dinnerdict = tempdict
            }
            
            if breakfast && lunch {
                lunchdict = tempdict
            }
        }
        
        meals = [bfastdict, lunchdict, dinnerdict]
        
        return meals
    }
}