//
//  TableViewCell.swift
//  JSON_Test
//
//  Created by tmtech1 on 15/02/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}