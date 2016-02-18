//
//  TableViewInTableCell.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/17.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class TableViewInTableCell: UIViewController,TableViewInCellDelegate {

    @IBOutlet weak var menuview: UITableView!
    
    let arySection = ["基本情報","いきごみメッセージ","応募したバイト","カスタマの応募日","交通","携帯電話/メール","電話/メール","希望連絡時間帯","学歴","資格","レギュラー","Sフラグ","自己PR","制服サイズ","過去の職歴","勤務歴"]
    
    var aryCellActive:[Bool] = [false,false,false,false]
    
    var ary15 = ["応募者の活動履歴","勤務履歴（職種別）","勤務履歴（バイト別）","自社プロフィール確認履歴"]
    
    /**
     xibを読み込む
     */
    override func loadView() {
        if let view = UINib(nibName: "TableViewInTableCell", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib  = UINib(nibName: "TableViewInCell", bundle:nil)
        menuview.registerNib(nib, forCellReuseIdentifier:"TableViewInCell")
        // Do any additional setup after loading the view.
    }
    
    
    /*
    * セクション数を指定する
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return arySection.count
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 15{
            return 4
        }else{
            return 1
        }
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        if indexPath.section == 15{
            
            var height:CGFloat = 0
            
            switch indexPath.row{
            case 0:
                height = 45
                break
            case 2:
                height = 45
                break
            case 4:
                height = 45
                break
            case 6:
                height = 45
                break
            default:
                
                if aryCellActive[indexPath.row] == true{
                    height = 100
                }else{
                    height = 0
                }
                
                break
            }
            
            return height
        }else{
            return 45
        }
    }
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = PaddingLabel(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().applicationFrame.size.width, height: 20))
        
        if arySection.count > section{
            label.text = arySection[section]
        }
        
        return label
        
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 15{
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
        if section == 15{
            return 50
        }else{
            return CGFloat.min
        }
        
    }
    
    /*
    * Cellに値を設定する.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 15{
            let cell: TableViewInCell = tableView.dequeueReusableCellWithIdentifier("TableViewInCell") as! TableViewInCell
            cell.delegate = self
            return cell
        }else{
            let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "UITableViewCell")
            return cell
        }
        
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 15{
            let cell = menuview.cellForRowAtIndexPath(indexPath) as! TableViewInCell
            cell.isActive = !cell.isActive
            aryCellActive[indexPath.row] = !cell.isActive
        }
        
    }
    
    /**
     テキストを表示
     
     - parameter strText: <#strText description#>
     */
    func gotoNext(strText: String) {
        print(strText)
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
