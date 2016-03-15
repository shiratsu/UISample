//
//  AnotherVarticalCalendar.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/03/15.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class AnotherVarticalCalendar: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var calendarView: UITableView!
    
    /**
     xibを読み込む
     */
    override func loadView() {
        if let view = UINib(nibName: "AnotherVarticalCalendar", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calendarView.delegate = self
        calendarView.dataSource = self
        
        let nib  = UINib(nibName: "AutoCalendarCell", bundle:nil)
        calendarView.registerNib(nib, forCellReuseIdentifier:"AutoCalendarCell")
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
    
    /*
    * セクション数を指定する
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            return 1
        }else if section == 1 {
            return 2
        }else{
            return 3
        }
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        
        var cellHeight:CGFloat = 0
        let calendarHeight = AutoCalendarCell.heightForAutoCell(calendarView)
        cellHeight = 15+calendarHeight
        
        return calendarHeight
        
    }
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().applicationFrame.size.width, height: 20))
        if section == 0{
            label.text = "カレンダー一個の時"
        }else if section == 1 {
            label.text = "カレンダー二個の時"
        }else{
            label.text = "カレンダー三個の時"
        }
        return label
        
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 2{
            let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().applicationFrame.size.width, height: 50))
            return view
        }else{
            return nil
        }
        
    }
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        
        return 20
    }
    
    
    
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        if section == 2{
            return 50
        }else{
            return CGFloat.min
        }
        
    }
    
    /*
    * Cellに値を設定する.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print(UIScreen.mainScreen().applicationFrame.size.width)
        let cell: AutoCalendarCell = tableView.dequeueReusableCellWithIdentifier("AutoCalendarCell") as! AutoCalendarCell
        
        
        if indexPath.section == 0{
            cell.setUpCalendar(2016, month: 1, aryCheck: [5,6,7,11,20],aryAnother: [5,6,11],cellWIdth: UIScreen.mainScreen().applicationFrame.size.width)
            
        }
        if indexPath.section == 1{
            if indexPath.row == 0{
                cell.setUpCalendar(2016, month: 1, aryCheck: [7,8,9,13,18,25],aryAnother: [8,9,18],cellWIdth: UIScreen.mainScreen().applicationFrame.size.width)
            }
            if indexPath.row == 1{
                cell.setUpCalendar(2016, month: 2, aryCheck: [3,10,11,25],aryAnother: [10,11],cellWIdth: UIScreen.mainScreen().applicationFrame.size.width)
            }
        }
        if indexPath.section == 2{
            if indexPath.row == 0{
                cell.setUpCalendar(2016, month: 1, aryCheck: [2,13,15,26,27,28],aryAnother: [27,28],cellWIdth: UIScreen.mainScreen().applicationFrame.size.width)
            }
            if indexPath.row == 1{
                cell.setUpCalendar(2016, month: 2, aryCheck: [1,9,29],aryAnother: [9,29],cellWIdth: UIScreen.mainScreen().applicationFrame.size.width)
            }
            if indexPath.row == 2{
                cell.setUpCalendar(2016, month: 3, aryCheck: [5,17,20],aryAnother: [17],cellWIdth: UIScreen.mainScreen().applicationFrame.size.width)
            }
        }
        
        
        return cell
        
        
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
