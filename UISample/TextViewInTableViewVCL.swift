//
//  TextViewInTableViewVCL.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/03/07.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class TextViewInTableViewVCL: UIViewController,TextViewInCellDelegate {

    @IBOutlet weak var testTable: UITableView!
    
    var textViewCellHeight:CGFloat = 45
    var strLast:String! = ""
    /**
     xibを読み込む
     */
    override func loadView() {
        if let view = UINib(nibName: "TextViewInTableViewVCL", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib  = UINib(nibName: "TextViewInCell", bundle:nil)
        testTable.registerNib(nib, forCellReuseIdentifier:"TextViewInCell")
    }
    
    /*
    * セクション数を指定する
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        if indexPath.section == 0{
            return textViewCellHeight
        }else{
            return 45
        }
    }
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().applicationFrame.size.width, height: 20))
        if section == 0{
            label.text = "テキスト"
        }
        return label
        
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1{
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
        if section == 1{
            return 50
        }else{
            return CGFloat.min
        }
        
    }
    
    /*
    * Cellに値を設定する.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell: TextViewInCell = tableView.dequeueReusableCellWithIdentifier("TextViewInCell") as! TextViewInCell
            cell.delegate = self
            cell.setTextViewData(textViewCellHeight, strAlready: strLast)
            return cell
        }else{
            let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "UITableViewCell")
            return cell
        }
        
    }
    
    func reloadCell(cellHeight: CGFloat, strLastText: String) {
        strLast = strLastText
        textViewCellHeight = cellHeight
        let indexpath = NSIndexPath(forRow: 0, inSection: 0)
        
        self.testTable.beginUpdates()
        self.testTable.reloadRowsAtIndexPaths([indexpath], withRowAnimation: UITableViewRowAnimation.None)
        self.testTable.endUpdates()
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
