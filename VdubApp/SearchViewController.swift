//
//  SearchTableViewController.swift
//  VdubApp
//
//  Created by Alex on 3/1/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    var allFoods = [String]()
    var filtered = [String]()
    var favorites = [String]()
    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var searchBar: UISearchBar!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        if let obj = defaults.objectForKey("favorite foods") as? [String] {
            favorites = obj
        }
        
        allFoods = AllFoodsRetriever.getAllFoods()
        filtered = allFoods
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.registerClass(UITableViewCell().classForCoder, forCellReuseIdentifier: "reuseIdentifier")
        
        
        //let nib = UINib(nibName: "SearchTableViewCell", bundle: nil)
        //tableView.registerNib(nib, forCellReuseIdentifier: "reuseIdentifier")

        searchBar.delegate = self
        
        searchBar.autocapitalizationType = UITextAutocapitalizationType.None
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered.count
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let favs = defaults.objectForKey("favorite foods") as? [String] {
            let text = filtered[indexPath.row]
            if favs.contains(text) {
                let newFavorites = favs.filter { $0 != text }
                defaults.setObject(newFavorites, forKey: "favorite foods")
            }
            else {
                var newFavorites = favs
                newFavorites.append(text)
                defaults.setObject(newFavorites, forKey: "favorite foods")
            }
        }
        
        if let obj = defaults.objectForKey("favorite foods") as? [String] {
            favorites = obj
        }
        
        self.tableView.reloadData()
    }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        cell.textLabel!.text = filtered[indexPath.row]
        
        if favorites.contains(filtered[indexPath.row]) {
            cell.textLabel!.font = UIFont.boldSystemFontOfSize(17.0)
        } else {
            cell.textLabel!.font = UIFont.systemFontOfSize(16.0)
        }
        cell.selectionStyle = UITableViewCellSelectionStyle.None

        
        return cell
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        filtered = searchText.isEmpty ? allFoods : allFoods.filter({(dataString: String) -> Bool in
            return dataString.rangeOfString(searchText, options: .CaseInsensitiveSearch) != nil
        })
        tableView.reloadData()
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
