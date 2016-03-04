//
//  SettingsViewController.swift
//  VdubApp
//
//  Created by Alex on 2/28/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var segControl: UISegmentedControl!
    
    @IBAction func changeDefault(sender: UISegmentedControl) {
        let new = sender.selectedSegmentIndex
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(new, forKey: "default dining hall")
        defaults.synchronize()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if let defaultHall = defaults.objectForKey("default dining hall") as? Int {
            segControl.selectedSegmentIndex = defaultHall
        }
        
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
