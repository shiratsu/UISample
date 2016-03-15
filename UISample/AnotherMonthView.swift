//
//  MonthView.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/10.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class AnotherMonthView: UIView {
    
    var titleLabel: UILabel!
    var baseView:UIView!
    
    let aryWeek = ["日","月","火","水","木","金","土"]
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpLabel(text:String,floatFontSize:CGFloat = 15){
        
        if titleLabel != nil{
            if titleLabel.isDescendantOfView(self){
                self.titleLabel.removeFromSuperview()
            }
        }
        
        let textSize = text.sizeWithAttributes([NSFontAttributeName: UIFont(name: "HiraginoSans-W3", size: floatFontSize)!])
        
        let diff = (self.frame.size.width - textSize.width)/2
        
        titleLabel = UILabel(frame: CGRect(x: diff, y: 5, width: textSize.width+10, height: floatFontSize))
        
        titleLabel.font = UIFont(name: "HiraginoSans-W3", size: floatFontSize)
        titleLabel.text = text
        
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        //追加する
        let title_center = NSLayoutConstraint(
            item: self.titleLabel,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: .Equal,
            toItem: self,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: 0)
        title_center.priority = 1000
        self.addConstraint(title_center)
        
        //追加する
        let titleTop = NSLayoutConstraint(
            item: self.titleLabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: 2)
        titleTop.priority = 1000
        self.addConstraint(titleTop)
        
        baseView = UIView()
        self.addSubview(baseView)
        
        baseView.translatesAutoresizingMaskIntoConstraints = false
        
        //追加する
        let baseTop = NSLayoutConstraint(item: self.baseView,attribute: NSLayoutAttribute.Top,relatedBy: .Equal,toItem: self.titleLabel,attribute: NSLayoutAttribute.Bottom,multiplier: 1.0,constant: 3)
        self.addConstraint(baseTop)
        
        let baseLeading = NSLayoutConstraint(item: self.baseView,attribute: NSLayoutAttribute.Leading,relatedBy: .Equal,toItem: self,attribute: NSLayoutAttribute.Leading,multiplier: 1.0,constant: 0)
        self.addConstraint(baseLeading)
        
        let baseBottom = NSLayoutConstraint(item: self.baseView,attribute: NSLayoutAttribute.Bottom,relatedBy: .Equal,toItem: self,attribute: NSLayoutAttribute.Bottom,multiplier: 1.0,constant: 0)
        self.addConstraint(baseBottom)
        
        let baseTrailing = NSLayoutConstraint(item: self.baseView,attribute: NSLayoutAttribute.Trailing,relatedBy: .Equal,toItem: self,attribute: NSLayoutAttribute.Trailing,multiplier: 1.0,constant: 0)
        self.addConstraint(baseTrailing)
        
    }
    
    func setUpDays(year:Int,month:Int,aryCheckDays:[Int],firstY:Int,aryAnotherCheck:[Int] = [],floatFontSize:CGFloat = 15){
        
        let subViews:[UIView] = self.subviews as [UIView]
        for view in subViews {
            if view.isKindOfClass(DayView) {
                view.removeFromSuperview()
            }
        }
        
        let day:Int! = self.getLastDay(year,month:month);
        let dayWidth:Int = Int( frame.size.width / 7.0 )
        let dayHeight:Int = dayWidth-8
        var prevView:AnotherDayView? = nil
        //まずは曜日をセット
        var i = 0
        for weekday in aryWeek{
            let x:Int       = (i * (dayWidth));
            let y:Int       = firstY
            let frame:CGRect = CGRectMake(CGFloat(x),
                CGFloat(y),
                CGFloat(dayWidth),
                CGFloat(dayHeight)
            );
            
            let dayView:AnotherDayView = AnotherDayView(frame: frame, week: weekday,floatFontSize:floatFontSize)
            baseView.addSubview(dayView)
            
            dayView.translatesAutoresizingMaskIntoConstraints = false
            
            
            if weekday == "日"{
                let dayX = NSLayoutConstraint(
                    item: dayView,
                    attribute: NSLayoutAttribute.Leading,
                    relatedBy: .Equal,
                    toItem: baseView,
                    attribute: NSLayoutAttribute.Leading,
                    multiplier: 1,
                    constant: 0)
                
                baseView.addConstraint(dayX)
                
            }else{
                if prevView != nil{
                    let dayX = NSLayoutConstraint(
                        item: dayView,
                        attribute: NSLayoutAttribute.Leading,
                        relatedBy: .Equal,
                        toItem: prevView,
                        attribute: NSLayoutAttribute.Trailing,
                        multiplier: 1,
                        constant: 0)
                    
                    dayView.addConstraint(dayX)
                }
                
                
            }
            
            
            
            let dayY = NSLayoutConstraint(
                item: dayView,
                attribute: NSLayoutAttribute.Top,
                relatedBy: .Equal,
                toItem: baseView,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1,
                constant: 0)
            
            baseView.addConstraint(dayY)
            
            
            let dayWidth = NSLayoutConstraint(
                item: dayView,
                attribute: NSLayoutAttribute.Width,
                relatedBy: .Equal,
                toItem: baseView,
                attribute: NSLayoutAttribute.Width,
                multiplier: 0.14,
                constant: 0)
            dayWidth.priority = 1000
            baseView.addConstraint(dayWidth)
            
            
            prevView = dayView
            
            i+=1
        }
        
        var lastYHeight = 0
        
        if day != nil {
            prevView = nil
            //初日の曜日を取得
            var weekday:Int = self.getWeekDay(year,month: month,day:1)
            for var i:Int = 0; i < day!;i++ {
                let week:Int    = self.getWeek(year,month: month,day:i+1)+1
                let x:Int       = ((weekday - 1 ) * (dayWidth));
                let y:Int       = (week-1) * dayHeight+firstY
                let frame:CGRect = CGRectMake(CGFloat(x),
                    CGFloat(y),
                    CGFloat(dayWidth),
                    CGFloat(dayHeight)
                );
                
                let dayView:AnotherDayView = AnotherDayView(frame: frame, year:year,month:month,day:i+1,weekday:weekday,floatFontSize:floatFontSize)
                if aryCheckDays.contains(dayView.dayInt){
                    dayView.backgroundColor = UIColor.orangeColor()
                }
                
                //他の選択色を付けたい場合
                if aryAnotherCheck.contains(dayView.dayInt){
                    dayView.dayLabel.backgroundColor = UIColor.greenColor()
                    dayView.dayLabel.textColor = UIColor.whiteColor()
                    
                }
                
                self.addSubview(dayView)
                
                if i == 0{
                    dayView.translatesAutoresizingMaskIntoConstraints = false
                    
                    let dayX = NSLayoutConstraint(
                        item: dayView,
                        attribute: NSLayoutAttribute.Leading,
                        relatedBy: .Equal,
                        toItem: self,
                        attribute: NSLayoutAttribute.Leading,
                        multiplier: 1,
                        constant: CGFloat(x))
                    
                    self.addConstraint(dayX)
                    
                    let dayY = NSLayoutConstraint(
                        item: dayView,
                        attribute: NSLayoutAttribute.Top,
                        relatedBy: .Equal,
                        toItem: self,
                        attribute: NSLayoutAttribute.Top,
                        multiplier: 1,
                        constant: CGFloat(y))
                    
                    self.addConstraint(dayY)
                    
                    
                    let dayWidth = NSLayoutConstraint(
                        item: dayView,
                        attribute: NSLayoutAttribute.Width,
                        relatedBy: .Equal,
                        toItem: self,
                        attribute: NSLayoutAttribute.Width,
                        multiplier: 0.14,
                        constant: 0)
                    dayWidth.priority = 1000
                    self.addConstraint(dayWidth)
                }
                
                
                
                
                weekday+=1
                if weekday > 7 {
                    weekday = 1
                }
                
                lastYHeight = y+dayHeight
            }
            
            //最後にmonthviewの高さをセット
            self.frame.size.height = CGFloat(lastYHeight)
        }
    }
    
    //その月の最終日の取得
    func getLastDay(var year:Int,var month:Int) -> Int!{
        let dateFormatter:NSDateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "yyyy/MM/dd";
        if month == 12 {
            month = 0
            year++
        }
        let targetDate:NSDate? = dateFormatter.dateFromString(String(format:"%04d/%02d/01",year,month+1));
        if targetDate != nil {
            //月初から一日前を計算し、月末の日付を取得
            let orgDate = NSDate(timeInterval:(24*60*60)*(-1), sinceDate: targetDate!)
            let lastDayFormatter:NSDateFormatter = NSDateFormatter();
            lastDayFormatter.dateFormat = "dd";
            
            let str:String = lastDayFormatter.stringFromDate(orgDate)
            //lastPathComponentを利用するのは目的として違う気も。。
            print(Int(str))
            return Int(str)
        }
        
        return nil;
    }
    
    //曜日の取得
    func getWeek(year:Int,month:Int,day:Int) ->Int{
        
        let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
        let date = calendar.dateWithEra(1, year: year, month: month, day: day, hour: 0, minute: 0, second: 0, nanosecond: 0)
        
        if date != nil {
            
            let calender: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let comps: NSDateComponents = calender.components([NSCalendarUnit.Year
                ,NSCalendarUnit.Month
                ,NSCalendarUnit.Day
                ,NSCalendarUnit.Hour
                ,NSCalendarUnit.Minute
                ,NSCalendarUnit.Second
                ,NSCalendarUnit.Weekday
                ,NSCalendarUnit.WeekOfMonth
                ], fromDate: date!)
            print(comps.weekOfMonth)
            return comps.weekOfMonth;
        }
        return 0;
    }
    
    //第何週の取得
    func getWeekDay(year:Int,month:Int,day:Int) ->Int{
        let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
        let date = calendar.dateWithEra(1, year: year, month: month, day: day, hour: 0, minute: 0, second: 0, nanosecond: 0)
        if date != nil {
            let calender: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let comps: NSDateComponents = calender.components([NSCalendarUnit.Year
                ,NSCalendarUnit.Month
                ,NSCalendarUnit.Day
                ,NSCalendarUnit.Hour
                ,NSCalendarUnit.Minute
                ,NSCalendarUnit.Second
                ,NSCalendarUnit.Weekday], fromDate: date!)
            print(comps.weekday)
            return comps.weekday;
        }
        return 0;
    }
    
    
    
    
}
