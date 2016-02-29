//
//  MutableHeightCell.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/26.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class MutableHeightCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textLabel!.preferredMaxLayoutWidth = CGRectGetWidth(self.bounds)
        
    }
    
    func setCellText(strText:String){
        self.textLabel?.numberOfLines = 0
        self.textLabel?.font = UIFont(name: "HiraKakuSans-W3", size: 15)
        self.textLabel!.text = strText
        self.textLabel?.layoutIfNeeded()
        self.layoutIfNeeded()
        
    }
    
    
    /**
     文字列の高さを計算して、セルの幅をいい感じに決めてくれるメソッド
     
     - parameter tableView: <#tableView description#>
     - parameter strText:   <#strText description#>
     
     - returns: <#return value description#>
     */
    class func heightForLabel(tableView: UITableView, strText:String) -> CGFloat {
        struct Sizing {
            static var cell: MutableHeightCell?
        }
        if Sizing.cell == nil {
            Sizing.cell = tableView.dequeueReusableCellWithIdentifier("MutableHeightCell") as? MutableHeightCell
        }
        if let cell = Sizing.cell {
            cell.frame.size.width = CGRectGetWidth(tableView.bounds)
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.font = UIFont(name: "HiraKakuSans-W3", size: 15)
            cell.textLabel!.text = strText
            cell.layoutIfNeeded()
            let size = cell.textLabel!.intrinsicContentSize()
            return size.height
        }
        return 0
    }
    
    
}
