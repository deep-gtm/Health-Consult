//
//  FirstAidMythTableCell.swift
//  Health Consult
//
//  Created by Deepanshu Gautam on 13/10/20.
//  Copyright © 2020 Deepanshu Gautam. All rights reserved.
//

import UIKit

class FirstAidMythTableCell: UITableViewCell {
    @IBOutlet weak var cellCount: UILabel!
    @IBOutlet weak var cellText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        cellCount.layer.cornerRadius = cellCount.frame.height / 2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
