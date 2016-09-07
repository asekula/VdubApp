//
//  ViewWebsiteOptionsTableViewController.swift
//  VdubApp
//
//  Created by Alex on 6/28/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class ViewWebsiteOptionsTableViewController: UITableViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? WebsiteViewController {
            if let cell = sender as? UITableViewCell {
                if let text = cell.reuseIdentifier { // Change later.
                    switch text {
                    case "Ratty", "VDub":
                        destination.location = text
                        destination.title = text
                    default: print("Text label did not contain valid dining hall.")
                    }
                } else {
                    print("Could not get cell text")
                }
            } else {
                print("Sender to website view controller is not a TableViewCell.")
            }
        }
    }
}
