//
//  InformationViewCell.swift
//  Health Consult
//
//  Created by Deepanshu Gautam on 16/10/20.
//  Copyright © 2020 Deepanshu Gautam. All rights reserved.
//

import UIKit

class InformationViewCell: UITableViewCell {

    @IBOutlet weak var informationCellHeadingLabel: UILabel!
    
    @IBOutlet weak var informationCellTaxtLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        informationCellHeadingLabel.layer.cornerRadius = informationCellTaxtLabel.frame.height / 5

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
