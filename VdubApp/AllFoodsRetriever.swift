//
//  AllFoodsRetriever.swift
//  VdubApp
//
//  Created by Alex on 3/6/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import Foundation
import SwiftyJSON

class AllFoodsRetriever {
    
    static var allFoods: [String] = []
    
    static func getAllFoods() -> Bool {
    
        if !Reachability.isConnectedToNetwork() {
            return false
        }
        
        if allFoods.count > 0 {
            return true
        }
        
        
        let connection: AllFoodsNSURLSession = AllFoodsNSURLSession()
        
        // First ratty:
        connection.setMyQuery("ratty")
        connection.data_request()
        
        var data: [JSON] = connection.dataComplete
        
        while data.count == 0 {
            data = connection.dataComplete // SHOULDN'T RUN IF CONNECTION RETURNS "ERROR"
        }
        
        if data.count == 1 {
            return false
        }
        
        for jsonVal in data {
            if let s = jsonVal.string {
                if !allFoods.contains(s) {
                    allFoods.append(s)
                }
            }
        }
        
        connection.setMyQuery("vdub")
        connection.data_request()
        
        data = connection.dataComplete
        
        while data.count == 0 {
            data = connection.dataComplete // SHOULDN'T RUN IF CONNECTION RETURNS "ERROR"
        }
        
        if data.count == 1 {
            return true
        }
        
        for jsonVal in data {
            if let s = jsonVal.string {
                if !allFoods.contains(s) {
                    allFoods.append(s)
                }
            }
        }
        
        return true
    }
}