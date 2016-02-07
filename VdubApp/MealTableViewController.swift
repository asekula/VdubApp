//
//  MealTableViewController.swift
//  VdubApp
//
//  Created by Joseph Romano on 2/6/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit
import SwiftyJSON

class MealTableViewController: UITableViewController {

    var menu: [String:[String]]?
    var keys: [String]?
    var meal: Int = 0
    var diningHall = 0 {
        didSet {
            
            menu = [String: [String]]()
            //print("dininghall = \(diningHall) and meal = \(meal)")
            
            //print("Dining hall set")
            //connection.setMyQuery("vdub&day=10") //TODO: day
            //connection.data_request()
            let restOfUrl: String
            if diningHall == 0 {
                print("staring url vdub request")
                restOfUrl = "vdub&day=10"
                if MenuSingleton.sharedInstance.vdubMenu[0].stringValue == "I" {
                    connection.setMyQuery(restOfUrl) //TODO: day
                    connection.data_request()
                    //print("Set singleton")
                    while MenuSingleton.sharedInstance.vdubMenu[0].stringValue == "I" {
                        //Just hang out for a bit
                    }
                }
            } else {
                print("staring url ratty request")
                restOfUrl = "ratty&day=10"
                if MenuSingleton.sharedInstance.rattyMenu[0].stringValue == "I" {
                    connection.setMyQuery(restOfUrl) //TODO: day
                    connection.data_request()
                    //print("Set singleton")
                    while MenuSingleton.sharedInstance.rattyMenu[0].stringValue == "I" {
                        //Just hang out for a bit
                    }
                }
            }
            
            
            var theMenu: [String: JSON]
            
            if diningHall == 0 {
                var tempMeal = meal
                if meal > 0 {
                    tempMeal += 1
                }
                theMenu = MenuSingleton.sharedInstance.vdubMenu[tempMeal].dictionaryValue
                    
            } else {
                theMenu = MenuSingleton.sharedInstance.rattyMenu[meal].dictionaryValue
            }
            //print(theMenu)
            for key in theMenu.keys {
                //print(theMenu[key])
                //print(theMenu[key]!.arrayValue.debugDescription)
                let jsonMenuItems = theMenu[key]!.arrayValue
                if jsonMenuItems.count > 1 {
                    //print(jsonMenuItems)
                    var stringArr = [String]()
                    for jsonVal in jsonMenuItems {
                        if let s = jsonVal.string {
                            stringArr.append(s)
                        }
                    }
                    menu![key] = stringArr
                    //menu![key] = jsonMenuItems.map { $0.stringValue }
                }
            }
            
            keys = Array(menu!.keys)
            
            //print("\(menu)")
            
            self.tableView.registerClass(UITableViewCell().classForCoder, forCellReuseIdentifier: "reuseIdentifier")
            
            //after api loads
            print("reloading data")
            self.tableView.reloadData()
            
        }
    }
    var connection: MenuNSURLSession = MenuNSURLSession()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Fixes top allignment.
        tableView.contentInset = UIEdgeInsetsMake(0.0, 0.0, 48.0, 0.0)
        
        //if let theNav = super.view.viewWithTag(50) as? UISegmentedControl {
            //diningHall = theNav.titleForSegmentAtIndex(theNav.selectedSegmentIndex)!
        //}
        //if MenuSingleton.sharedInstance.rattyMenu {
            
        //}
        //connection.setMyQuery("vdub&day=10")
        //connection.data_request()
        
        menu = [String: [String]]()
        
        //TODO: initialize keys and menu
        
        diningHall = 0
        //
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //print("hellow")
        if let k = keys {
            //print(k.count)
            return k.count
            
        }
        return 0 // TODO: get from network call ("Chef's Corner" etc.)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let m = menu {
            if let k = keys {
                //print(m[k[section]]!.count)
                return m[k[section]]!.count
            }
        }
        return 0 // TODO: get from network call (pass in number of section)
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        
        if let m = menu {
            if let k = keys {
                let sectionItems = m[k[indexPath.section]]
                cell.textLabel!.text = sectionItems![indexPath.row]
                //print(sectionItems![indexPath.row])
            }
        }

        // Configure the cell...

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
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
