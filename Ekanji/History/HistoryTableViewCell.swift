//
//  HistoryTableViewCell.swift
//  Ekanji
//
//  Created by Hiromu Nakano on 2020/01/24.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var originalLabel: UILabel!
    @IBOutlet weak var convertedLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
