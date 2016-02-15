//
//  OneCalendarCell.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/15.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class OneCalendarCell: UITableViewCell {

    
    @IBOutlet weak var firstCalendar: MonthView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        firstCalendar.titleLabel.text = ""
    }
    
    func setUpCalendar(year:Int,month:Int,aryCheck:[Int] = [],aryAnother:[Int] = []){
        
        firstCalendar.setUpLabel(String(year)+"年"+String(month)+"月",floatFontSize: 12)
        firstCalendar.setUpDays(year, month: month,aryCheckDays: aryCheck,firstY: 15,aryAnotherCheck:aryAnother,floatFontSize: 11)
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
