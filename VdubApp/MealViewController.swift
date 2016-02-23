//
//  MealViewController.swift
//  VdubApp
//
//  Created by Alex on 2/22/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class MealViewController: UIViewController {

    
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tabItems = tabBar.items! as [UITabBarItem]
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
        
        segmentedControl.layer.cornerRadius = 5;
        segmentedControl.clipsToBounds = true;
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
