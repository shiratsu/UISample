//
//  AutoLayoutCell.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/03/09.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class AutoLayoutCell: UITableViewCell {

    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    /**
     データをセット
     */
    func setData(is2Column: Bool){
        
        let aryConstraints = self.contentView.constraints
        print(aryConstraints)
        
        if is2Column == true{
            for constraint in aryConstraints {
                
                if constraint.identifier != nil{
                    if constraint.identifier == "left_constraint"{
                        self.contentView.removeConstraint(constraint)
                        
                        //追加する
                        let left_constraint = NSLayoutConstraint(
                            item: self.secondLabel,
                            attribute: NSLayoutAttribute.Leading,
                            relatedBy: .Equal,
                            toItem: self.contentView,
                            attribute: NSLayoutAttribute.Leading,
                            multiplier: 1.0,
                            constant: 6)
                        
                        self.contentView.addConstraint(left_constraint)
                        
                    }else if constraint.identifier == "secondlabel_top"{
                        self.contentView.removeConstraint(constraint)
                        
                        //追加する
                        let secondlabel_top = NSLayoutConstraint(
                            item: self.secondLabel,
                            attribute: NSLayoutAttribute.Top,
                            relatedBy: .Equal,
                            toItem: self.firstLabel,
                            attribute: NSLayoutAttribute.Bottom,
                            multiplier: 1.0,
                            constant: 6)
                        
                        self.contentView.addConstraint(secondlabel_top)
                    }
                }
                
                
            }
            
        }
        
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func heightForThisCell(tableView: UITableView, is2Column: Bool) -> CGFloat {
        struct Sizing {
            static var cell: AutoLayoutCell?
        }
        if Sizing.cell == nil {
            Sizing.cell = tableView.dequeueReusableCellWithIdentifier("AutoLayoutCell") as? AutoLayoutCell
        }
        if let cell = Sizing.cell {
            cell.frame.size.width = CGRectGetWidth(tableView.bounds)
            
            if is2Column == true{
                return 100
            }else{
                return 80
            }
            
        }
        return 0
    }
    
    class func heightForThisCellAnother(tableView: UITableView, is2Column: Bool) -> CGFloat {
        struct Sizing {
            static var cell: AutoLayoutCell?
        }
        if Sizing.cell == nil {
            Sizing.cell = tableView.dequeueReusableCellWithIdentifier("AutoLayoutCell") as? AutoLayoutCell
        }
        if let cell = Sizing.cell {
            cell.frame.size.width = CGRectGetWidth(tableView.bounds)
            
            if is2Column == true{
                return 100
            }else{
                return 80
            }
            
        }
        return 0
    }
    
}
