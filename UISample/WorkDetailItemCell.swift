//
//  WorkDetailItemCell.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/26.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class WorkDetailItemCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = ""
        self.itemLabel.text = ""
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setDetailItem(dicInfo:NSDictionary){
        
    }
    
    
}
