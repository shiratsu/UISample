//
//  LandScapeCalendar.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/12.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class LandScapeCalendar: UIViewController {

    @IBOutlet weak var calendarScrollView: UIScrollView!
    
    /**
     xibを読み込む
     */
    override func loadView() {
        if let view = UINib(nibName: "LandScapeCalendar", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        calendarScrollView.translatesAutoresizingMaskIntoConstraints = true
        
        let monthview1 = MonthView(frame: CGRect(x: 10, y: 5, width: 150, height: 205))
        monthview1.setUpLabel("2016年1月")
        monthview1.setUpDays(2016, month: 1,aryCheckDays: [2,20,21])
        calendarScrollView.addSubview(monthview1)
        
        let monthview2 = MonthView(frame: CGRect(x: 170, y: 5, width: 150, height: 205))
        monthview2.setUpLabel("2016年2月")
        monthview2.setUpDays(2016, month: 2,aryCheckDays: [1,20,21])
        calendarScrollView.addSubview(monthview2)
        
        let monthview3 = MonthView(frame: CGRect(x: 330, y: 5, width: 150, height: 205))
        monthview3.setUpLabel("2016年3月")
        monthview3.setUpDays(2016, month: 3,aryCheckDays: [3,30,15])
        calendarScrollView.addSubview(monthview3)
        
        calendarScrollView.contentSize = CGSize(width: 500, height: 240)
        calendarScrollView.contentOffset = CGPointZero

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
