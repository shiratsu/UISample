//
//  AutoLayoutByPG.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/03/09.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class AutoLayoutByPG: UIViewController {

    @IBOutlet weak var alTable: UITableView!
    
    /**
     xibを読み込む
     */
    override func loadView() {
        if let view = UINib(nibName: "AutoLayoutByPG", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib  = UINib(nibName: "AutoLayoutCell", bundle:nil)
        alTable.registerNib(nib, forCellReuseIdentifier:"AutoLayoutCell")
        
        // Do any additional setup after loading the view.
    }
    
    /*
    * セクション数を指定する
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        
        if indexPath.row == 0{
            return AutoLayoutCell.heightForThisCell(alTable, is2Column: false)
        }else if indexPath.row == 1{
            return AutoLayoutCell.heightForThisCell(alTable, is2Column: true)
        }else{
            return AutoLayoutCell.heightForThisCellAnother(alTable, is2Column: true)
        }
        
    }
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().applicationFrame.size.width, height: 20))
        if section == 0{
            label.text = "ノーマル"
        }else if section == 1{
            label.text = "カラム落ち１"
        }else if section == 2{
            label.text = "カラム落ち２"
            
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
        
        let cell: AutoLayoutCell = tableView.dequeueReusableCellWithIdentifier("AutoLayoutCell") as! AutoLayoutCell
        
        if indexPath.row == 0{
            cell.setData(false)
        }else if indexPath.row == 1{
            cell.setData(true)
        }else if indexPath.row == 2{
            cell.setData(true)
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
