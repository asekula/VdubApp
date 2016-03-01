//
//  FavoritesTableView.swift
//  VdubApp
//
//  Created by Alex on 2/29/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController {

    let defaults = NSUserDefaults.standardUserDefaults()
    var foods = [String]()
    
    override func viewDidLoad() {
        if let obj = defaults.objectForKey("favorite foods") {
            if let foodList = obj as? [String] {
                self.foods = foodList
            }
        }
        self.tableView.registerClass(UITableViewCell().classForCoder, forCellReuseIdentifier: "reuseIdentifier")
        self.tableView.allowsSelectionDuringEditing = false
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        
        cell.textLabel?.text = foods[indexPath.row]
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true;
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            foods.removeAtIndex(indexPath.row)
            // UPDATE ALLFAVORITES
            defaults.setObject(foods, forKey: "favorite foods")
            defaults.synchronize()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            self.reloadInputViews()
        }
    }
}
