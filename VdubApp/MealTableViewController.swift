//
//  MealTableViewController.swift
//  VdubApp
//
//  Created by Joseph Romano on 2/6/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {

    var menu: [String:[String]]?
    var keys: [String]?
    var meal: Int = 0
    var connection: MenuNSURLSession = MenuNSURLSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Fixes top allignment.
        tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
        
        connection.setMyQuery("menu?client_id=e5e5e5f6-f300-48f9-ab95-c57d6c731cba&eatery=vdub&day=10")
        connection.data_request()
        
        menu = [String: [String]]()
        
        if meal == 0 {
            menu!["daily sidebars"]=["sliced provolone", "roast beef", "tomatoes"]
            menu!["main menu"]=["pancakes", "scrambled eggs and bacon", "hash browns", "french toast", "sausage patties"]
        } else if meal == 1 {
            menu!["daily sidebars"]=["sliced asdasdasdasd", "roast beef", "tomatoes"]
            menu!["main menu"]=["pancakes", "scrambled eggs and bacon", "hash browns", "french toast", "sausage patties"]
        } else {
            menu!["daily sidebars"]=["sliced provolone", "roast beef", "tomatoes"]
            menu!["main menu"]=["pancasdasdasdasdasdakes", "scrambled eggs and bacon", "hash browns", "french toast", "sausage patties"]
            
        }
        //TODO: initialize keys and menu
        keys = Array(menu!.keys)
        
        //print("\(menu)")
        
        self.tableView.registerClass(UITableViewCell().classForCoder, forCellReuseIdentifier: "reuseIdentifier")
        
        //after api loads
        self.tableView.reloadData()
        
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
            print(k.count)
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
