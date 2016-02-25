//
//  MenuNSURLSession.swift
//  VdubApp
//
//  Created by Alex on 2/6/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit
import SwiftyJSON

class ApiNSURLSession: NSObject, NSURLSessionDelegate, NSURLSessionTaskDelegate {
    var host = "https://api.students.brown.edu/dining/menu?client_id=e5e5e5f6-f300-48f9-ab95-c57d6c731cba&eatery="
    var query = String()
    var replyData: NSData = NSData()
    var dataComplete:[JSON] = []
    
    func setMyQuery(query:NSString) {
        self.query = host + (query as String)
    }
    
    func data_request() {
        dataComplete = []
        let url:NSURL = NSURL(string: query)!
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: url)
        
        let task = session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
            if let d = data {
                let json = JSON(data: d)
                let arrRep = json["menus"].arrayValue
                
                self.dataComplete = arrRep
            }
            else {
                print("Could not get data. Error: ")
                print(error)
            }
        });
        task.resume()
    }
}
