//
//  TabBarController.swift
//  VdubApp
//
//  Created by Alex on 2/6/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func dayForward(sender: AnyObject) {
        if let nav = selectedViewController as? UINavigationController, let mvc = nav.viewControllers.first as? MealTableViewController
        {
            backButton.hidden = false
            mvc.dayOffSet += 1
        }
    }
    
    @IBAction func dayBack(sender: AnyObject) {
        if let nav = selectedViewController as? UINavigationController, let mvc = nav.viewControllers.first as? MealTableViewController
        {
            if mvc.dayOffSet > 0 {
                mvc.dayOffSet -= 1
                if mvc.dayOffSet == 0 {
                    backButton.hidden = true
                }
            }
        }
    }
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func diningHallChange(sender: AnyObject) {
        if let nav = selectedViewController as? UINavigationController, let mvc = nav.viewControllers.first as? MealTableViewController
        {
                //if let mvc = mealVC {
                    // makes sure that the view is initalized so we can set the meal
                mvc.tableView.reloadData()
                    // sets the correct meal for the ALL dining halls
                let s = sender as? UISegmentedControl
                mvc.diningHall = s!.selectedSegmentIndex
                //}
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let hour = NSCalendar.currentCalendar().component(.Hour, fromDate: NSDate())
        let minute = NSCalendar.currentCalendar().component(.Minute, fromDate: NSDate())
        
        //print("\(hour) hour")
        //print("\(minute) minute")
        
        
        if (hour > 9 || (hour == 9 && minute > 30)) && hour < 14 {
            //select lunch
            self.selectedViewController=self.viewControllers![1]
       
        } else if hour > 14 {
            //select dinner
            self.selectedViewController=self.viewControllers![2]
        }
        
        //if let a = self.selectedViewController as? MealTableViewController {
        //    a.diningHall = 0 // Next meal in day
        //}
        // Do any additional setup after loading the view.
        segmentedControl.layer.cornerRadius = 5;
        segmentedControl.clipsToBounds = true;
        backButton.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        let tabBarItems = tabBar.items
        if tabBarItems!.indexOf(item) == 3 {
            segmentedControl.hidden = true
        } else {
            segmentedControl.hidden = false
        }
    }

*/



    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
