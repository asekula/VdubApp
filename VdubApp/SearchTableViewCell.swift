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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addedFood(sender: AnyObject) {
    }
}
