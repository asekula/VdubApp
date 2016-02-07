//
//  TabBarController.swift
//  VdubApp
//
//  Created by Alex on 2/6/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    
    @IBAction func diningHallChange(sender: AnyObject) {
        switch(self.selectedViewController) {
        case is MealTableViewController:
            let VCs = self.viewControllers!
            for vc in VCs {
                let mealvc = vc as? MealTableViewController
                if let mvc = mealvc {
                    mvc.diningHall = sender.selectedSegmentIndex
                    print("changed mvc \(mvc.meal)")
                } else {
                    print("nil vc")
                }
            }
        default: break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
