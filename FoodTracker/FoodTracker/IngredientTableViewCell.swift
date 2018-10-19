//
//  IngredientTableViewCell.swift
//  FoodTracker
//
//  Created by Kathryn Blair on 2018-10-18.
//  Copyright © 2018 Kathryn Blair. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {
    //Mark: Properties
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var ingredientNameLabel: UILabel!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
