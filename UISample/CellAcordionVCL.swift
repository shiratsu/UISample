//
//  CellAcordionVCL.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/18.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class CellAcordionVCL: UIViewController {

    @IBOutlet weak var menuView: UITableView!
    
    let arySection = ["基本情報","いきごみメッセージ","応募したバイト","カスタマの応募日","交通","携帯電話/メール","電話/メール","希望連絡時間帯","学歴","資格","レギュラー","Sフラグ","自己PR","制服サイズ","過去の職歴","勤務歴"]
    
    var aryCellActive:[Bool] = [false,false,false,false]
    
    var aryCellCtrl:NSMutableArray = NSMutableArray(array:[0,1,2,3])
    
    let intFirst = 99
    let intSecond = 98
    let intThird = 97
    let intForth = 96

    var aryFirst:NSArray = NSArray(array: [["test":"aaaaaaa"],["test":"bbbbb"]])
    var arySecond:NSArray = NSArray(array: [["test":"cccc"],["test":"ggggggggggg"],["test":"qqqqqqq"]])
    var aryThird:NSArray = NSArray(array: [["test":"ddddd"]])
    var aryForth:NSArray = NSArray(array: [["test":"eeeee"],["test":"lllllll"]])
    
    var aryTable:NSMutableArray = NSMutableArray(array: ["UITableViewCell","UITableViewCell","UITableViewCell","UITableViewCell"])
    var aryMutablle15:NSMutableArray = NSMutableArray(array: ["応募者の活動履歴","勤務履歴（職種別）","勤務履歴（バイト別）","自社プロフィール確認履歴"])
    
    /**
     xibを読み込む
     */
    override func loadView() {
        if let view = UINib(nibName: "CellAcordionVCL", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var nib  = UINib(nibName: "FirstCustomCell", bundle:nil)
        menuView.registerNib(nib, forCellReuseIdentifier:"FirstCustomCell")
        
        nib = UINib(nibName: "SecondCustomCell", bundle:nil)
        menuView.registerNib(nib, forCellReuseIdentifier:"SecondCustomCell")
        
        nib = UINib(nibName: "ThirdCustomCell", bundle:nil)
        menuView.registerNib(nib, forCellReuseIdentifier:"ThirdCustomCell")
        
        nib = UINib(nibName: "ForthCustomCell", bundle:nil)
        menuView.registerNib(nib, forCellReuseIdentifier:"ForthCustomCell")
        
        
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
            
            return aryMutablle15.count
        }else{
            return 1
        }
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 45
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
        
        if indexPath.section != 15{
            let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "UITableViewCell")
            cell.textLabel!.text = "aaaaaaaaa"
            
            return cell
        }else{
            
            let cell0: FirstCustomCell = tableView.dequeueReusableCellWithIdentifier("FirstCustomCell") as! FirstCustomCell
            let cell1: SecondCustomCell = tableView.dequeueReusableCellWithIdentifier("SecondCustomCell") as! SecondCustomCell
            let cell2: ThirdCustomCell = tableView.dequeueReusableCellWithIdentifier("ThirdCustomCell") as! ThirdCustomCell
            let cell3: ForthCustomCell = tableView.dequeueReusableCellWithIdentifier("ForthCustomCell") as! ForthCustomCell
            
            let cellIndex = aryCellCtrl.objectAtIndex(indexPath.row) as! Int
            
            if cellIndex == 0 || cellIndex == 1 || cellIndex == 2 || cellIndex == 3{
                
                print(aryMutablle15)
                print(indexPath.row)
                print(aryMutablle15.objectAtIndex(indexPath.row))
                
                let str = aryMutablle15.objectAtIndex(indexPath.row) as! String
                let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "UITableViewCell")
                cell.textLabel!.text = str
                
                return cell
                
            }else if cellIndex == 99 {
                let dic = aryMutablle15.objectAtIndex(indexPath.row) as! NSDictionary
                
                cell0.textLabel!.text = dic.objectForKey("test") as! String
                
                return cell0
            }else if cellIndex == 98 {
                let dic = aryMutablle15.objectAtIndex(indexPath.row) as! NSDictionary
                
                cell1.textLabel!.text = dic.objectForKey("test") as! String
                
                return cell1
                
            }else if cellIndex == 97 {
                let dic = aryMutablle15.objectAtIndex(indexPath.row) as! NSDictionary
                
                cell2.textLabel!.text = dic.objectForKey("test") as! String
                
                return cell2
            }else {
                let dic = aryMutablle15.objectAtIndex(indexPath.row) as! NSDictionary
                
                cell3.textLabel!.text = dic.objectForKey("test") as! String
                
                return cell3
            }
            
        }
        
        
        
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 15{
            let cellIndex = aryCellCtrl.objectAtIndex(indexPath.row) as! Int
            
            if cellIndex == 0 || cellIndex == 1 || cellIndex == 2 || cellIndex == 3{
                let expandCloseInt = aryCellCtrl.objectAtIndex(indexPath.row) as! Int
                
                handleCell(indexPath, expandInt: expandCloseInt)
                
            }else if cellIndex == 99 {
                print("1")
            }else if cellIndex == 98 {
                print("2")
            }else if cellIndex == 97 {
                print("3")
            }else {
                print("4")
            }
            
            
        }
        
    }
    
    func handleCell(indexPath:NSIndexPath,expandInt:Int){
        
        let expandIndex = expandInt
        
        let bool = aryCellActive[expandIndex]
        
        
        //この時は展開
        if bool == false{
            
            let indexPaths = NSMutableArray()
            
            var insert_pos = indexPath.row
            
            switch expandIndex {
            case 0:
                for obj in aryFirst{
                    
                    insert_pos += 1
                    
                    aryTable.insertObject("FirstCustomCell", atIndex: insert_pos)
                    aryMutablle15.insertObject(obj, atIndex: insert_pos)
                    aryCellCtrl.insertObject(99, atIndex: insert_pos)
                    
                    indexPaths.addObject(NSIndexPath(forRow: insert_pos, inSection: indexPath.section))
                }
                break
            case 1:
                for obj in arySecond{
                    
                    insert_pos += 1
                    
                    aryTable.insertObject("SecondCustomCell", atIndex: insert_pos)
                    aryMutablle15.insertObject(obj, atIndex: insert_pos)
                    aryCellCtrl.insertObject(98, atIndex: insert_pos)
                    
                    indexPaths.addObject(NSIndexPath(forRow: insert_pos, inSection: indexPath.section))
                }
                break
            case 2:
                for obj in aryThird{
                    
                    insert_pos += 1
                    
                    aryTable.insertObject("ThirdCustomCell", atIndex: insert_pos)
                    aryMutablle15.insertObject(obj, atIndex: insert_pos)
                    aryCellCtrl.insertObject(97, atIndex: insert_pos)
                    
                    indexPaths.addObject(NSIndexPath(forRow: insert_pos, inSection: indexPath.section))
                }
                break
            case 3:
                for obj in aryForth{
                    
                    insert_pos += 1
                    
                    aryTable.insertObject("ForthCustomCell", atIndex: insert_pos)
                    aryMutablle15.insertObject(obj, atIndex: insert_pos)
                    aryCellCtrl.insertObject(96, atIndex: insert_pos)
                    
                    indexPaths.addObject(NSIndexPath(forRow: insert_pos, inSection: indexPath.section))
                }
                break
            
            default:
                break
            }
            
            let reload_ary = indexPaths.copy() as! NSArray
            aryCellActive[expandIndex] = !bool
            self.menuView.insertRowsAtIndexPaths(reload_ary as! [NSIndexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            
            
            
        //こっちは閉じる
        }else{
            
            
            let indexPaths = NSMutableArray()
            
            //配列の添字削除
            let insert_pos = indexPath.row+1
            
            //テーブル用削除インデックス
            var index = indexPath.row
            
            
            switch expandIndex {
            case 0:
                for _ in aryFirst{
                    
                    index += 1
                    
                    aryMutablle15.removeObjectAtIndex(insert_pos)
                    aryCellCtrl.removeObjectAtIndex(insert_pos)
                    
                    indexPaths.addObject(NSIndexPath(forRow: index, inSection: indexPath.section))
                }
                break
            case 1:
                
                for _ in arySecond{
                    
                    index += 1
                    aryMutablle15.removeObjectAtIndex(insert_pos)
                    aryCellCtrl.removeObjectAtIndex(insert_pos)
                    
                    indexPaths.addObject(NSIndexPath(forRow: index, inSection: indexPath.section))
                }
                break
            case 2:
                
                for _ in aryThird{
                    index += 1
                    
                    aryMutablle15.removeObjectAtIndex(insert_pos)
                    aryCellCtrl.removeObjectAtIndex(insert_pos)
                    
                    indexPaths.addObject(NSIndexPath(forRow: index, inSection: indexPath.section))
                }
                break
            case 3:
                for _ in aryForth{
                    index += 1
                    
                    aryMutablle15.removeObjectAtIndex(insert_pos)
                    aryCellCtrl.removeObjectAtIndex(insert_pos)
                    
                    indexPaths.addObject(NSIndexPath(forRow: index, inSection: indexPath.section))
                }
                break
                
            default:
                break
            }
            
            let reload_ary = indexPaths.copy() as! NSArray
            aryCellActive[expandIndex] = !bool
            self.menuView.deleteRowsAtIndexPaths(reload_ary as! [NSIndexPath], withRowAnimation: UITableViewRowAnimation.Middle)
            
            
        }
        
        
        
        
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
