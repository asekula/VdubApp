//
//  MenuSingleton.swift
//  VdubApp
//
//  Created by Alex on 2/6/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import SwiftyJSON

class MenuSingleton {
    static let sharedInstance = MenuSingleton()
    var vdubMenu: [JSON] = ["I", "am", "a", "json"]
    var rattyMenu: [JSON] = ["I", "am", "a", "json"]
    
    private init() {
        //Do nothing!
    }
    
    func setMenu(eatery: NSInteger, menu: [JSON]) {
        if (eatery == 1) {
            rattyMenu = menu
        } else if (eatery == 0) {
            vdubMenu = menu
        } else {
            print("Not yet implemented.")
        }
        //print("set menu \(vdubMenu)")
    }
    
    func getMenu(eatery: NSInteger, meal: NSInteger) -> [String:JSON] {
        if (eatery == 1) {
            return rattyMenu[meal].dictionaryValue
            
            //return rattyMenu
        } else if (eatery == 0) {
            return vdubMenu[meal].dictionaryValue
        } else {
            print("Not yet implemented")
            return [:]
        }
    }
}
