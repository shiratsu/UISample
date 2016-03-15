//
//  AutoCalendarCell.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/03/15.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class AutoCalendarCell: UITableViewCell {

    
    @IBOutlet weak var calendar: AnotherMonthView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        calendar.titleLabel.text = ""
    }
    
    func setUpCalendar(year:Int,month:Int,aryCheck:[Int] = [],aryAnother:[Int] = [],cellWIdth:CGFloat){
        
        calendar.setUpLabel(String(year)+"年"+String(month)+"月",floatFontSize: 12,cellWidth: cellWIdth-16)
        calendar.setUpDays(year, month: month,aryCheckDays: aryCheck,firstY: 15,aryAnotherCheck:aryAnother,floatFontSize: 11,cellWidth: cellWIdth-16)
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /**
     文字列の高さを計算して、セルの幅をいい感じに決めてくれるメソッド
     
     - parameter tableView: <#tableView description#>
     - parameter strText:   <#strText description#>
     
     - returns: <#return value description#>
     */
    class func heightForAutoCell(tableView: UITableView) -> CGFloat {
        struct Sizing {
            static var cell: AutoCalendarCell?
        }
        if Sizing.cell == nil {
            Sizing.cell = tableView.dequeueReusableCellWithIdentifier("AutoCalendarCell") as? AutoCalendarCell
        }
        if let cell = Sizing.cell {
            cell.frame.size.width = CGRectGetWidth(tableView.bounds)
            cell.calendar.layoutIfNeeded()
            cell.layoutIfNeeded()
            return cell.frame.size.height
        }
        return 205
    }
    
    
}
