//
//  土曜日は青             dayLabel.textColor = UIColor.blueColor()         }         self.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/10.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class AnotherDayView: UIView {
    
    var dayInt:Int! = 0
    var dayLabel:UILabel! = nil
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame:CGRect,year:Int,month:Int,day:Int,weekday:Int,floatFontSize:CGFloat = 12){
        super.init(frame: frame)
        let dayWidth:CGFloat = frame.width
        let dayHeight:CGFloat = frame.height
        dayLabel = UILabel(frame: CGRectMake(1, 1, dayWidth-2,dayHeight-2))
        dayLabel.layer.cornerRadius = 3
        dayLabel.clipsToBounds = true
        dayLabel.textAlignment = NSTextAlignment.Center
        dayLabel.text = String(format:"%02d", day)
        dayLabel.font = UIFont(name: "HiraKakuProN-W3", size: floatFontSize)
        dayInt = day
        if weekday == 1 {
            //日曜日は赤
            dayLabel.textColor = UIColor.redColor()
        } else if weekday == 7 {
            //土曜日は青
            dayLabel.textColor = UIColor.blueColor()
        }
        self.addSubview(dayLabel)
        
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let centerx = NSLayoutConstraint(
            item: self.dayLabel,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: .Equal,
            toItem: self,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: 0)
        centerx.priority = 1000
        let centery = NSLayoutConstraint(
            item: self.dayLabel,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: .Equal,
            toItem: self,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: 0)
        centery.priority = 1000
        self.addConstraint(centery)
    }
    
    init(frame:CGRect,week:String,floatFontSize:CGFloat = 12){
        super.init(frame: frame)
        let dayWidth:CGFloat = frame.width
        let dayHeight:CGFloat = frame.height
        let dayLabel:UILabel = UILabel(frame: CGRectMake(0, 0, dayWidth,dayHeight))
        
        dayLabel.font = UIFont(name: "HiraKakuProN-W3", size: floatFontSize)
        dayLabel.textAlignment = NSTextAlignment.Center
        dayLabel.text = week
        self.addSubview(dayLabel)
        
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let centerx = NSLayoutConstraint(
            item: dayLabel,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: .Equal,
            toItem: self,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: 0)
        centerx.priority = 1000
        let centery = NSLayoutConstraint(
            item: dayLabel,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: .Equal,
            toItem: self,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: 0)
        centery.priority = 1000
        self.addConstraint(centery)
    }
}

