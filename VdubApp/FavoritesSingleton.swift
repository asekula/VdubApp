//
//  FavoritesSingleton.swift
//  VdubApp
//
//  Created by Alex on 2/7/16.
//  Copyright © 2016 Alex. All rights reserved.
//

class FavoritesSingleton {
    static let sharedInstance = FavoritesSingleton()
    var favorites = [String]()
    
    private init() {
        //Defeats instantiation
    }
    
}
