//
//  MealViewController.swift
//  VdubApp
//
//  Created by Alex on 2/22/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITabBarDelegate, UITableViewDelegate, UITableViewDataSource {

    var menuHandler: MenuHandler = MenuHandler()
    
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func hallChange(sender: UISegmentedControl) {
        menuHandler.switchHall(sender.selectedSegmentIndex)
        refresh()
    }
    
    @IBAction func back(sender: AnyObject) {
        menuHandler.back() // Guaranteed to work.
        // back() is only called if the backButton is enabled.
        forwardButton.enabled = true
        if !menuHandler.canBack() {
            backButton.enabled = false
        }
        refresh()
    }
    
    @IBAction func forward(sender: AnyObject) {
        menuHandler.forward() // Guaranteed to work.
        backButton.enabled = true
        if !menuHandler.canForward() {
            forwardButton.enabled = false
        }
        refresh()
        menuHandler.retrieveData()
    }
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        if let title = item.title {
            if title == "Breakfast" {
                menuHandler.changeMeal(0)
            } else if title == "Lunch" {
                menuHandler.changeMeal(1)
            } else if title == "Dinner" {
                menuHandler.changeMeal(2)
            }
            refresh()
        }
        else { // Tab was "More"
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("MoreInfo")
            //self.presentViewController(vc as! UIViewController, animated: true, completion: nil)
            self.showViewController(vc as! UIViewController, sender: vc)
        }
    }
    
    func refresh() {
        self.tableView.reloadData()
        self.navBar.topItem?.title = menuHandler.dayOfWeek()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Tableview.
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell().classForCoder, forCellReuseIdentifier: "reuseIdentifier")
        
        // Bar Button Items.
        backButton.enabled = false
        forwardButton.enabled = true
        
        // Nav Bar.
        navBar.clipsToBounds = true
        self.navBar.topItem?.title = menuHandler.dayOfWeek()

        // Segmented Control.
        segmentedControl.layer.cornerRadius = 5;
        segmentedControl.clipsToBounds = true;
        if Date.isWeekend(0) {
            segmentedControl.selectedSegmentIndex = 1
            menuHandler.switchHall(1)
        }
        
        // Tab Bar.
        tabBar.delegate = self
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
        
        tabBar.selectedItem = tabItem0
        let hour = Date.getHour()
        if hour < 10 {
            tabBar.selectedItem = tabItem0
            refresh()
        } else if hour < 14 {
            menuHandler.changeMeal(1)
            tabBar.selectedItem = tabItem1
        } else {
            menuHandler.changeMeal(2)
            tabBar.selectedItem = tabItem2
        }
    
    }
    
    override func viewDidAppear(animated: Bool) {
        menuHandler.retrieveData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Might actually need this.
    }
    
    // TableView functions -----------------------------------------------------------
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return menuHandler.numberOfKeys()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuHandler.elementsInSection(section)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        cell.textLabel!.text = menuHandler.getItem(indexPath.section, row: indexPath.row)
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menuHandler.sectionTitle(section)
    }
    
    // THIS makes headers the right color pls don't touch
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        //recast your view as a UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor(red: 0.81, green: 0.0, blue: 0.0, alpha: 1.0)
        header.textLabel!.textColor = UIColor.whiteColor() //make the text white
        header.alpha = 0.68 //make the header transparent
    }
}