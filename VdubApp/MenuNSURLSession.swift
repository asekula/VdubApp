//
//  MenuNSURLSession.swift
//  VdubApp
//
//  Created by Alex on 2/6/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit
import SwiftyJSON

class MenuNSURLSession: NSObject, NSURLSessionDelegate, NSURLSessionTaskDelegate {
    var host = "https://api.students.brown.edu/dining/menu?client_id=e5e5e5f6-f300-48f9-ab95-c57d6c731cba&eatery="
    var query = String()
    var replyData: NSData = NSData()
    
    func setMyQuery(query:NSString) {
        self.query = host + (query as String)

        //print(query)
    }
    
    func data_request() {
        let url:NSURL = NSURL(string: query)!
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: url)
        
        let task = session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
            if let d = data {
                //self.replyData = r.Respons
                // NSJSONSerialization.JSONObjectWithData(d, options: NSJSONReadingOptions.AllowFragments)
                //print(data)

                let json = JSON(data: d)
                var arrRep = json["menus"].arrayValue
                //print("Array Representation: ")
                //print(arrRep)
                if arrRep.count == 0 {
                    arrRep = [ ["eatery":"vdub"] ]
                }
                
                
                let eatery = arrRep[0].dictionaryValue["eatery"]
                if (eatery == "ratty") {
                    //print("connection finish")
                    MenuSingleton.sharedInstance.setMenu(1, menu: arrRep)
                } else if (eatery == "vdub") {
                    //print("connection finish")
                    MenuSingleton.sharedInstance.setMenu(0, menu: arrRep)
                } else {
                    print("Unexpected eatery in JSON parse")
                }
                
                //Future goal: Print to file?
            }
            else {
                print("Could not get data. Error: ")
                print(error)
            }
        });
        //print("starting connection")
        task.resume()
        
    }
}
