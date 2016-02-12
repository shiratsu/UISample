//
//  土曜日は青             dayLabel.textColor = UIColor.blueColor()         }         self.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/10.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class DayView: UIView {
    
    var dayInt:Int! = 0
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame:CGRect,year:Int,month:Int,day:Int,weekday:Int){
        super.init(frame: frame)
        let dayWidth:Int = Int(frame.width)
        let dayHeight:CGFloat = frame.height
        let dayLabel:UILabel = UILabel(frame: CGRectMake(0, 0, CGFloat(dayWidth),dayHeight))
        dayLabel.textAlignment = NSTextAlignment.Center
        dayLabel.text = String(format:"%02d", day)
        dayInt = day
        if weekday == 1 {
            //日曜日は赤
            dayLabel.textColor = UIColor.redColor()
        } else if weekday == 7 {
            //土曜日は青
            dayLabel.textColor = UIColor.blueColor()
        }
        self.addSubview(dayLabel)
    }
    
    init(frame:CGRect,week:String){
        super.init(frame: frame)
        let dayWidth:Int = Int(frame.width)
        let dayHeight:CGFloat = frame.height
        let dayLabel:UILabel = UILabel(frame: CGRectMake(0, 0, CGFloat(dayWidth),dayHeight))
        dayLabel.textAlignment = NSTextAlignment.Center
        dayLabel.text = week
        self.addSubview(dayLabel)
    }
}
