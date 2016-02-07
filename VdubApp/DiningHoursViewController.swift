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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundle = NSBundle.mainBundle()
        let url = bundle.URLForResource("home", withExtension: "html");
        let request = NSURLRequest(URL: url!);
        webView.loadRequest(request)
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
