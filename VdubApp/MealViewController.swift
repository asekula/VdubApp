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
        if menuHandler.canBack() {
            menuHandler.back() // Guaranteed to work.
            // back() is only called if the backButton is enabled.
            forwardButton.enabled = true
            if !menuHandler.canBack() {
                backButton.enabled = false
            }
            refresh()
        }
    }
    
    @IBAction func forward(sender: AnyObject) {
        if menuHandler.canForward() {
            menuHandler.forward() // Guaranteed to work.
            backButton.enabled = true
            if !menuHandler.canForward() {
                forwardButton.enabled = false
            }
            
            refresh()
            
            // multithreading
            loadInBackground()
        }
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
            
            //self.dismissViewControllerAnimated(true, completion: nil)
            self.presentViewController(vc as! UIViewController, animated: true, completion: nil)
            //self.showViewController(vc as! UIViewController, sender: vc)
        }
    }
    
    func refresh() {
        self.tableView.reloadData()
        self.navBar.topItem?.title = menuHandler.dayOfWeek()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Tableview.
        //tableView.delegate = self
        //tableView.dataSource = self
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "reuseIdentifier")
        //self.tableView.registerClass(UITableViewCell().classForCoder, forCellReuseIdentifier: "reuseIdentifier")
        //tableView.allowsSelection = false;
        //tableView.
        
        // Bar Button Items.
        backButton.enabled = false
        forwardButton.enabled = false // until it retrieves the next day's data in view did appear

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
        // Sets seg control as default dining hall if set.
        let defaults = NSUserDefaults.standardUserDefaults()
        if let defaultHall = defaults.objectForKey("default dining hall") as? Int {
            segmentedControl.selectedSegmentIndex = defaultHall
            menuHandler.switchHall(defaultHall)
        }
        
        // Tab Bar.
        tabBar.delegate = self
        
        // Automatically sets selected meal.
        let hour = Date.getHour()
        if hour < 10 {
            tabBar.selectedItem = tabBar.items![0]
            //tabBar.selectedItem = tabItem0
            refresh()
        } else if hour < 14 {
            menuHandler.changeMeal(1)
            tabBar.selectedItem = tabBar.items![1]
            //tabBar.selectedItem = tabItem1
        } else {
            menuHandler.changeMeal(2)
            tabBar.selectedItem = tabBar.items![2]
            //tabBar.selectedItem = tabItem2
        }
        
        // Swipe gestures
        let forward: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "forward:")
        forward.direction = .Left
        
        let back: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "back:")
        back.direction = .Right
        
        self.view .addGestureRecognizer(forward)
        self.view .addGestureRecognizer(back)
        
        
        menuHandler.retrieveData() // Automaticall gets tomorrows data (offset = 1)
        
        // Should probably do this in the background.
        menuHandler.retrieveFavorites() // sets menuHandler.favorites
    }
    
    override func viewWillAppear(animated: Bool) {
        // For switching back from more.
        tabBar.selectedItem = tabBar.items![menuHandler.currentMeal]
        refresh()
    }
    
    override func viewDidAppear(animated: Bool) {
        loadInBackground()
    }
    
    //func viewWillUnload() {
        // Updates the database with the changes to allFavorites.
    //    menuHandler.pushFavoritesChanges()
    //}
    
    func loadInBackground() {
        print("loading \(menuHandler.retrievedIndex+1) in background")
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            //print("getting data")
            self.menuHandler.retrieveData()
            dispatch_async(dispatch_get_main_queue()) {
                if self.menuHandler.canForward() {
                    self.forwardButton.enabled = true
                }
            }
        }
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
        let cell:TableViewCell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! TableViewCell
        let food = menuHandler.getItem(indexPath.section, row: indexPath.row)
        
        cell.loadItem(food, amount: menuHandler.howFavorite(food), favorite: menuHandler.isFavorite(food))
        cell.selectionStyle = UITableViewCellSelectionStyle.None

        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menuHandler.sectionTitle(section)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let food = menuHandler.getItem(indexPath.section, row: indexPath.row)
        menuHandler.addFavorite(food)
        
        refresh()
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
