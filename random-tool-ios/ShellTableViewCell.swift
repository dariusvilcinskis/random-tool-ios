//
//  ShellTableViewCell.swift
//  random-tool-ios
//
//  Created by Darius Vilcinskis on 01/11/2017.
//  Copyright © 2017 Darius Vilcinskis. All rights reserved.
//

import UIKit

class ShellTableViewCell: UITableViewCell {

    //MARK: outlets
    @IBOutlet weak var MenuImage: UIImageView!
    
    @IBOutlet weak var MenuLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
