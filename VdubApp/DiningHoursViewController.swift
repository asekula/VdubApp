//
//  DiningHoursViewController.swift
//  
//
//  Created by Joseph Romano on 2/7/16.
//
//

import UIKit

class DiningHoursViewController: UIViewController {
    
    @IBOutlet var webView: UIWebView!
    
    var urlpath = NSBundle.mainBundle().pathForResource("hours", ofType: "html");
    
    func loadAddressURL(){
        // TODO: Figure out why.
        let requesturl = NSURL.fileURLWithPath(urlpath!)
        let request = NSURLRequest(URL: requesturl)
        webView.loadRequest(request)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAddressURL()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
