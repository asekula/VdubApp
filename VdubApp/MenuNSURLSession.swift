//
//  MenuNSURLSession.swift
//  VdubApp
//
//  Created by Alex on 2/6/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class MenuNSURLSession: NSObject, NSURLSessionDelegate, NSURLSessionTaskDelegate {
    var host = "https://api.students.brown.edu/dining/"
    var query = String()
    var replyData: NSData = NSData()
    
    func setMyQuery(query:NSString) {
        self.query = host + (query as String)
        //print(query)
        /* var url =  NSURLRequest( URL: self.query )
        var conn = NSURLConnection(request: url, delegate: self, startImmediately: true) */
    }
    
    func data_request() {
        let url:NSURL = NSURL(string: query)!
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: url)
        
        let task = session.dataTaskWithRequest(request, completionHandler: {(data, response, var error) in
            if let d = data {
                //self.replyData = r.Respons
                // NSJSONSerialization.JSONObjectWithData(d, options: NSJSONReadingOptions.AllowFragments)
                //print(data)
            }
            else {
                print("not found")
            }
        });
        
        task.resume()
        
    }
}
