//
//  SwitchWithCell.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/09.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class SwitchWithCell: UITableViewCell {

    
    @IBOutlet weak var testswitch: UISwitch!
    @IBOutlet weak var titleLabel: UILabel!
    var indexpath:NSIndexPath! = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(dic:[String:NSObject],atIndexPath:NSIndexPath){
        indexpath = atIndexPath
        
        titleLabel.text = dic["title"] as? String
        testswitch.on = (dic["value"] as? Bool)!
        
    }
    
    @IBAction func cellSwitch(sender: AnyObject) {
        
        let cellSwitch = sender as! UISwitch
        
        print(indexpath)
        print(cellSwitch.on)
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
