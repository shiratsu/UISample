//
//  TwoActionCell.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/03/17.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class TwoActionCell: UITableViewCell {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
