//
//  TableViewCell.swift
//  VdubApp
//
//  Created by Alex on 2/28/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var food: UILabel!
    @IBOutlet var amount: UILabel!
    @IBOutlet var star: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadItem(food: String, amount: Int, favorite:Bool) {
        self.food.text = food
        
        if favorite {
            self.food.font = UIFont.boldSystemFontOfSize(16.0)
        } else {
            self.food.font = UIFont.systemFontOfSize(16.0)
        }
        
        //self.star.setImage(UIImage(named: "star"), forState: .Normal)
        
        if amount > 0 {
            self.amount.text = "\(amount)"
        } else {
            self.amount.text = ""

        }
    }

}
