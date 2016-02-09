//
//  TabBarController.swift
//  VdubApp
//
//  Created by Alex on 2/6/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    var offset = 0
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func diningHallChange(sender: AnyObject) {
        for vc in self.viewControllers! { // annoying but w/e
            if let nav = vc as? UINavigationController, let mvc = nav.viewControllers.first as? MealTableViewController
            {
                let s = sender as? UISegmentedControl
                mvc.diningHall = s!.selectedSegmentIndex
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let hour = NSCalendar.currentCalendar().component(.Hour, fromDate: NSDate())
        let minute = NSCalendar.currentCalendar().component(.Minute, fromDate: NSDate())
        
        if (hour > 9 || (hour == 9 && minute > 30)) && hour < 14 {
            self.selectedViewController=self.viewControllers![1]
        } else if hour > 14 {
            self.selectedViewController=self.viewControllers![2]
        }
        
        let tabItems = self.tabBar.items! as [UITabBarItem]
        let tabItem0 = tabItems[0] as UITabBarItem
        let tabItem1 = tabItems[1] as UITabBarItem
        let tabItem2 = tabItems[2] as UITabBarItem
        tabItem0.title = "Breakfast"
        tabItem1.title = "Lunch"
        tabItem2.title = "Dinner"
        tabItem0.image = UIImage(named: "breakfast")
        tabItem1.image = UIImage(named: "lunch")
        tabItem2.image = UIImage(named: "dinner")
        tabItem0.selectedImage = UIImage(named: "breakfast")
        tabItem1.selectedImage = UIImage(named: "lunch")
        tabItem2.selectedImage = UIImage(named: "dinner")
        for(var i=0; i<3; i++) {
            if let nav = self.viewControllers![i] as? UINavigationController, let mvc = nav.viewControllers.first as? MealTableViewController
            {
                mvc.truemeal = i
            }
        }
        
        self.navigationController?.navigationBar
        segmentedControl.layer.cornerRadius = 5;
        segmentedControl.clipsToBounds = true;
        

    }

    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
