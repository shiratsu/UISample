//
//  TwoActionCell.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/03/17.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

public protocol TwoActionCellDelegate : class {
    
    func actionFirst(index:Int)
    func actionSecond(index:Int)
}


class TwoActionCell: UITableViewCell {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    weak var delegate:TwoActionCellDelegate?
    var indexPath:NSIndexPath! = nil
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUPAction(){
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "selectFirst:")
        tapGesture.numberOfTapsRequired = 1
        firstView.userInteractionEnabled = true
        firstView.addGestureRecognizer(tapGesture)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: "selectSecond:")
        tapGesture2.numberOfTapsRequired = 1
        secondView.userInteractionEnabled = true
        secondView.addGestureRecognizer(tapGesture2)
        
        
    }
    
    func selectFirst(tapGestureRecognizer: UITapGestureRecognizer) {
        self.delegate?.actionFirst(indexPath.row)
    }
    
    func selectSecond(tapGestureRecognizer: UITapGestureRecognizer) {
        self.delegate?.actionSecond(indexPath.row)
    }


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
