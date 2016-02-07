//
//  DiningHoursViewController.swift
//  
//
//  Created by Joseph Romano on 2/7/16.
//
//

import UIKit

class DiningHoursViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let localfilePath = NSBundle.mainBundle().URLForResource("hours", withExtension: "html");
        let myRequest = NSURLRequest(URL: localfilePath!);
        webView.loadRequest(myRequest);
        self.view.addSubview(webView)
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
