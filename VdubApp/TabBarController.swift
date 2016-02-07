//
//  TabBarController.swift
//  VdubApp
//
//  Created by Alex on 2/6/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func diningHallChange(sender: AnyObject) {
        switch(self.selectedViewController) {
        case is MealTableViewController:
            let VCs = self.viewControllers!
            for vc in VCs {
                let mealvc = vc as? MealTableViewController
                if let mvc = mealvc {
                    // makes sure that the view is initalized so we can set the meal
                    mvc.tableView.reloadData()
                    // sets the correct meal for the ALL dining halls
                    let s = sender as? UISegmentedControl
                    mvc.diningHall = s!.selectedSegmentIndex
                }
            }
        default: break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //if let a = self.selectedViewController as? MealTableViewController {
        //    a.diningHall = 0 // Next meal in day
        //}
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        let tabBarItems = tabBar.items
        if tabBarItems!.indexOf(item) == 3 {
            segmentedControl.hidden = true
        } else {
            segmentedControl.hidden = false
        }
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
