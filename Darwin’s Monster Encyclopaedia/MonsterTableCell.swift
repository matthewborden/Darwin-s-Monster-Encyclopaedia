//
//  TableViewCell.swift
//  Darwin’s Monster Encyclopaedia
//
//  Created by Matthew Borden on 13/4/17.
//  Copyright © 2017 Matthew Borden. All rights reserved.
//

import UIKit

class MonsterTableCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
