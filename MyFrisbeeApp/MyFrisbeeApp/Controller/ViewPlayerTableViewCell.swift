//
//  ViewPlayerTableViewCell.swift
//  MyFrisbeeApp
//
//  Created by Thomas on 2017/8/3.
//  Copyright © 2017年 Thomas. All rights reserved.
//

import UIKit

class ViewPlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var playerPositionLabel: UILabel!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerAvatarUIImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
