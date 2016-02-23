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
    
    /*@IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func diningHallChange(sender: AnyObject) {
        for vc in self.viewControllers! { // annoying but w/e
            if let nav = vc as? UINavigationController, let mvc = nav.viewControllers.first as? MealTableViewController
            {
                let s = sender as? UISegmentedControl
                mvc.diningHall = s!.selectedSegmentIndex
            }
        }
    }*/
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNeedsStatusBarAppearanceUpdate()
        
        /*let hour = Date.getHour()
        if (hour >= 10) && hour < 14 {
            self.selectedViewController=self.viewControllers![1]
        } else if hour >= 14 {
            self.selectedViewController=self.viewControllers![2]
        }
        
        let weekDay = Date.getWeekday()
        if weekDay == 0 || weekDay == 6 {
            segmentedControl.selectedSegmentIndex = 1
            /*for(var i=0; i<3; i++) {
                if let nav = self.viewControllers![i] as? UINavigationController, let mvc = nav.viewControllers.first as? MealTableViewController
                {
                    mvc.diningHall = 1
                }
            }*/
        }*/
        
        /*for(var i=0; i<3; i++) {
            if let nav = self.viewControllers![i] as? UINavigationController, let mvc = nav.viewControllers.first as? MealTableViewController
            {
                mvc.truemeal = i
            }
        }*/
        
        //self.navigationController?.navigationBar
        //segmentedControl.layer.cornerRadius = 5;
        //segmentedControl.clipsToBounds = true;
        

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
