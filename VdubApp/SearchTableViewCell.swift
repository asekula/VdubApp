//
//  SearchTableViewCell.swift
//  VdubApp
//
//  Created by Alex on 3/2/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var food: UILabel!
    @IBOutlet weak var button: UIButton!
    let defaults = NSUserDefaults.standardUserDefaults()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        //if let text = food.text {
        //    setFavOrNot(text)
        //}
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func changeFavorite(sender: UIButton) {
    
        if let favorites = defaults.objectForKey("favorite foods") as? [String] {
            if let text = food.text {
                if favorites.contains(text) {
                    let newFavorites = favorites.filter { $0 != text }
                    defaults.setObject(newFavorites, forKey: "favorite foods")
                }
                else {
                    var newFavorites = favorites
                    newFavorites.append(text)
                    defaults.setObject(newFavorites, forKey: "favorite foods")
                }
            }
        }
    }
    /*
    func setFavOrNot(item: String) {
        if let favorites = defaults.objectForKey("favorite foods") as? [String] {
            if favorites.contains(item) {
                let newFavs = favorites.filter { $0 == item }
                defaults.setObject(newFavs, forKey: "favorite foods")
                setNotBold()
            } else {
                var newFavs = favorites
                newFavs.append(item)
                defaults.setObject(newFavs, forKey: "favorite foods")
                setBold()
            }
        }
    }
    
    func setBold() {
        button.imageView!.image = UIImage(named: "minus_math")
        food.font = UIFont.boldSystemFontOfSize(16.0)
    }
    
    func setNotBold() {
        button.imageView!.image = UIImage(named: "plus_math")
        food.font = UIFont.systemFontOfSize(16.0)
    }
    */
}
