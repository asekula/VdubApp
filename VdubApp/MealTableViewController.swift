//
//  MealTableViewController.swift
//  VdubApp
//
//  Created by Joseph Romano on 2/6/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit
import SwiftyJSON

extension NSDate {
    func dayOfWeek() -> Int? {
        if
            let cal: NSCalendar = NSCalendar.currentCalendar(),
            let comp: NSDateComponents = cal.components(.Weekday, fromDate: self) {
                return comp.weekday
        } else {
            return nil
        }
    }
}

class MealTableViewController: UITableViewController {

    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBAction func dayBack(sender: AnyObject) {
        if dayOffSet > 0 {
            //forwardButton.enabled = true
            dayOffSet -= 1
            //print("DAYOFFSET MINUS ONE")
        }
        if dayOffSet == 0 {
            //backButton.enabled = false
        }
    }
    @IBAction func dayForward(sender: AnyObject) {
        if dayOffSet < 3 {
            //backButton.enabled = true
            dayOffSet += 1
            //print("DAYOFFSET PLUS ONE")
        }
        if dayOffSet == 3 {
            //forwardButton.enabled = false
        }
    }
    
    var menu: [String:[String]]?
    var keys: [String]?
    var truemeal: Int = 0
    var connection: MenuNSURLSession = MenuNSURLSession()
    var model = 6
    
    //Strange here, could change this later
    var dayOffSet: Int {
        get {
            let tabBar = self.navigationController!.tabBarController! as? TabBarController
            let offset = tabBar!.offset
            
            if offset == 0 {
                backButton.enabled = false
            } else {
                backButton.enabled = true
            }
            if offset == 3 {
                forwardButton.enabled = false
            } else {
                forwardButton.enabled = true
            }
            return offset
        }
        set {
            dateLabel.text = getDate(newValue)
            let tabBar = self.navigationController!.tabBarController! as? TabBarController
            tabBar!.offset = newValue

            MenuSingleton.sharedInstance.vdubMenu[0] = "I"
            MenuSingleton.sharedInstance.rattyMenu[0] = "I" // fix this with array of returnvalues (w.e. they are)
            refresh()
        }
    }
    
    var diningHall = 0 {
        didSet {
            refresh()
        }
    }
    
    func refresh() {
        //print(meal)
        //print("true meal \(truemeal)")
        menu = [String: [String]]()
        
        let restOfUrl: String
        
        let calendar = NSCalendar.currentCalendar()
        let newDate = calendar.dateByAddingUnit(.Day, value: dayOffSet, toDate: NSDate(), options: [])
        let weekend = calendar.isDateInWeekend(newDate!)
        let components = calendar.components([.Day , .Month , .Year], fromDate: newDate!)
        let day = components.day
        let month = components.month
        let max_time = 10  // 1 second
        
        //fix these resettings of menusingleton to 
        if diningHall == 0 {
            restOfUrl = "vdub&day=\(day)&month=\(month)"
            if MenuSingleton.sharedInstance.vdubMenu[0].stringValue == "I" {
                connection.setMyQuery(restOfUrl) //TODO: day
                connection.data_request()
                var count = 0
                while MenuSingleton.sharedInstance.vdubMenu[0].stringValue == "I" && count < max_time {
                    //sleep(1) // WATCH OUT HERE
                    NSThread.sleepForTimeInterval(0.1)
                    count += 1
                }
                if count >= max_time && MenuSingleton.sharedInstance.vdubMenu[0].stringValue == "I" {
                    let alert = UIAlertController(title: "It's a little slow.", message: "...or the menu doesn't exist.", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default, handler: { action in self.refresh() }))
                    alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: { action in
                        self.menu = nil
                        self.keys = nil
                        self.tableView.reloadData()
                    }))
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                    //display alert box, cancel or try again.
                }
            }
        } else {
            restOfUrl = "ratty&day=\(day)&month=\(month)"
            if MenuSingleton.sharedInstance.rattyMenu[0].stringValue == "I" {
                connection.setMyQuery(restOfUrl) //TODO: day
                connection.data_request()
                var count = 0
                while MenuSingleton.sharedInstance.rattyMenu[0].stringValue == "I" && count < max_time {
                    //sleep(1)
                    NSThread.sleepForTimeInterval(0.1)
                    count += 1
                }
                if count >= max_time && MenuSingleton.sharedInstance.rattyMenu[0].stringValue == "I"{
                    let alert = UIAlertController(title: "It's a little slow.", message: "...or the menu doesn't exist.", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default, handler: { action in self.refresh() }))
                    alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: { action in
                        self.menu = nil
                        self.keys = nil
                        self.tableView.reloadData()
                    } ))
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                    // alert box, cancel or try again.
                }
            }
        }
        
        var theMenu: [String: JSON]
        let meal = truemeal
        
        if diningHall == 0 {
            var tempMeal = meal
            if meal > 0 {
                tempMeal += 1
            }
            let tm = MenuSingleton.sharedInstance.vdubMenu
            if tm.count == 1 {
                theMenu = ["Closed": JSON(arrayLiteral: ["closed", "a"])] // doesn't actually display closed
            } else {
                theMenu = tm[tempMeal].dictionaryValue
            }
        } else {
            let tm = MenuSingleton.sharedInstance.rattyMenu
            if weekend && meal > 0 {
                theMenu = tm[meal-1].dictionaryValue
            }
            else {
                //print(meal)
                if meal < tm.count {
                    theMenu = tm[meal].dictionaryValue
                }
                else {
                    theMenu = [String: JSON]()

                }
            }
        }
        for key in theMenu.keys {
            let jsonMenuItems = theMenu[key]!.arrayValue
            if jsonMenuItems.count > 1 {
                var stringArr = [String]()
                for jsonVal in jsonMenuItems {
                    if let s = jsonVal.string {
                        stringArr.append(s)
                    }
                }
                menu![key] = stringArr
            }
        }
        
        if model >= 6 {
            keys = Array(menu!.keys)
        } else {
            keys = Array(menu!.keys).reverse()
        }
        self.tableView.registerClass(UITableViewCell().classForCoder, forCellReuseIdentifier: "reuseIdentifier")
        self.tableView.reloadData()
    }
    
    func getDate(offset: Int) -> String {
        let today = NSDate()
        let newdate = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: offset,
            toDate: today,
            options: NSCalendarOptions(rawValue: 0))
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        formatter.timeStyle = .MediumStyle
        
        let dateString = formatter.stringFromDate(newdate!)
        let fullNameArr = dateString.characters.split{$0 == ","}.map(String.init)
        //print(fullNameArr[0])
        
        let myComponents = NSCalendar.currentCalendar().components(.Weekday, fromDate: newdate!)
        let weekDay = myComponents.weekday
        var days = ["","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
        //print(weekDay)
        return("\(days[weekDay]), "+fullNameArr[0])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.allowsSelection = false;
        

        //set model:
        //print(UIDevice.currentDevice().model)
        
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 where value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        if identifier.containsString("7") || identifier.containsString("8") || identifier.containsString("6"){
            model = 6
        } else {
            model = 5
        }
        
        menu = [String: [String]]()
        
        if dayOffSet == 0 {
            backButton.enabled = false
        } else {
            backButton.enabled = true
        }
        forwardButton.enabled = true
        
        let redish = UIColor(red: 0.81, green: 0.0, blue: 0.0, alpha: 0.68)
        dateLabel.backgroundColor = redish
        
        //dayOffSet = 0
        
        refresh()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let tabBar = self.navigationController!.tabBarController! as? TabBarController
        self.navigationItem.titleView = tabBar!.segmentedControl
        dateLabel.text = getDate(dayOffSet)
        refresh()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.titleView = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let k = keys {
            return k.count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let m = menu {
            if let k = keys {
                return m[k[section]]!.count
            }
        }
        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        
        if let m = menu {
            if let k = keys {
                let sectionItems = m[k[indexPath.section]]
                cell.textLabel!.text = sectionItems![indexPath.row]
            }
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let k = keys {
            return k[section]
        }
        return ""
    }
    
    // THIS makes headers the right color pls don't touch
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        //recast your view as a UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor(red: 0.81, green: 0.0, blue: 0.0, alpha: 1.0)
        header.textLabel!.textColor = UIColor.whiteColor() //make the text white
        header.alpha = 0.68 //make the header transparent
    }
    
    
    
}
