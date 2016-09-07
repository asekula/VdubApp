//
//  WebsiteViewController.swift
//  VdubApp
//
//  Created by Alex on 6/28/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class WebsiteViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var location: String? {
        didSet {
            print("Set location")
            loadWebsite()
        }
    }
    
    var locationURL: NSURL? {
        if let locationString = location {
            switch locationString {
            case "Ratty":
                return NSURL(string: "http://www.brown.edu/Student_Services/Food_Services/eateries/refectory_menu.php")
            case "VDub":
                return NSURL(string: "http://www.brown.edu/Student_Services/Food_Services/eateries/verneywoolley_menu.php")
            default: return nil
            }
        } else {
            return nil
        }
    }
    
    func loadWebsite() {
        spinner?.startAnimating()
        if let url = locationURL {
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) {
                print("Requesting \(url)")
                let request = NSURLRequest(URL: url)
                dispatch_async(dispatch_get_main_queue()) {
                    self.webView.loadRequest(request)
                    self.spinner?.stopAnimating()
                }
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        if webView.request == nil {
            loadWebsite()
        }
    }
    
    override func viewDidLoad() {
        webView.scalesPageToFit = true
    }
}
