//
//  LeaderboardTableViewCell.swift
//  NunezJonathan_AdaptiveLayout
//
//  Created by Jonathan Nunez on 1/29/19.
//  Copyright © 2019 Jonathan Nunez. All rights reserved.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell {
    
    //MARK: Preparations
    @IBOutlet weak var initialsLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var totalMovesLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
