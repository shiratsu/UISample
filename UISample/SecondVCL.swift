//
//  SecondVCL.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/03/24.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit
import WebKit

class SecondVCL: UIViewController {
    
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
    
    var dic_height:NSMutableDictionary! = NSMutableDictionary()
    
    var strTest1 = "<ul class=\"list-nav-top\"><li><a href=\"http://sftworks.jp?igdef=1\" onclick=\"ga('send', 'event', 'TOPPREF', 'areaPref_txt', 'area_all');\">全国</a></li><li><a href=\"http://sftworks.jp/area_kansai\" onclick=\"ga('send', 'event', 'TOPPREF', 'areaPref_txt', 'area_kansai');\">関西エリア</a></li><li>大阪府</li><li><a href=\"http://sftworks.jp/pref_hyogo\" onclick=\"ga('send', 'event', 'TOPPREF', 'areaPref_txt', 'pref_hyogo');\">兵庫県</a></li><li><a href=\"http://sftworks.jp/pref_kyoto\" onclick=\"ga('send', 'event', 'TOPPREF', 'areaPref_txt', 'pref_kyoto');\">京都府</a></li><li><a href=\"http://sftworks.jp/pref_shiga\" onclick=\"ga('send', 'event', 'TOPPREF', 'areaPref_txt', 'pref_shiga');\">滋賀県</a></li><li><a href=\"http://sftworks.jp/pref_nara\" onclick=\"ga('send', 'event', 'TOPPREF', 'areaPref_txt', 'pref_nara');\">奈良県</a></li><li><a href=\"http://sftworks.jp/pref_wakayama\" onclick=\"ga('send', 'event', 'TOPPREF', 'areaPref_txt', 'pref_wakayama');\">和歌山県</a></li></ul><ul class=\"list-nav-top\"><li><a href=\"http://sftworks.jp?igdef=1\" onclick=\"ga('send', 'event', 'TOPPREF', 'areaPref_txt', 'area_all');\">全国</a></li><li><a href=\"http://sftworks.jp/area_kansai\" onclick=\"ga('send', 'event', 'TOPPREF', 'areaPref_txt', 'area_kansai');\">関西エリア</a></li><li>大阪府</li><li><a href=\"http://sftworks.jp/pref_hyogo\" onclick=\"ga('send', 'event', 'TOPPREF', 'areaPref_txt', 'pref_hyogo');\">兵庫県</a></li><li><a href=\"http://sftworks.jp/pref_kyoto\" onclick=\"ga('send', 'event', 'TOPPREF', 'areaPref_txt', 'pref_kyoto');\">京都府</a></li><li><a href=\"http://sftworks.jp/pref_shiga\" onclick=\"ga('send', 'event', 'TOPPREF', 'areaPref_txt', 'pref_shiga');\">滋賀県</a></li><li><a href=\"http://sftworks.jp/pref_nara\" onclick=\"ga('send', 'event', 'TOPPREF', 'areaPref_txt', 'pref_nara');\">奈良県</a></li><li><a href=\"http://sftworks.jp/pref_wakayama\" onclick=\"ga('send', 'event', 'TOPPREF', 'areaPref_txt', 'pref_wakayama');\">和歌山県</a></li></ul><ul class=\"list-nav-top\"><li><a href=\"http://sftworks.jp?igdef=1\" onclick=\"ga('send', 'event', 'TOPPREF', 'areaPref_txt', 'area_all');\">全国</a></li><li><a href=\"http://sftworks.jp/area_kansai\" onclick=\"ga('send', 'event', 'TOPPREF', 'areaPref_txt', 'area_kansai');\">関西エリア</a></li><li>大阪府</li><li><a href=\"http://sftworks.jp/pref_hyogo\" onclick=\"ga('send', 'event', 'TOPPREF', 'areaPref_txt', 'pref_hyogo');\">兵庫県</a></li><li><a href=\"http://sftworks.jp/pref_kyoto\" onclick=\"ga('send', 'event', 'TOPPREF', 'areaPref_txt', 'pref_kyoto');\">京都府</a></li><li><a href=\"http://sftworks.jp/pref_shiga\" onclick=\"ga('send', 'event', 'TOPPREF', 'areaPref_txt', 'pref_shiga');\">滋賀県</a></li><li><a href=\"http://sftworks.jp/pref_nara\" onclick=\"ga('send', 'event', 'TOPPREF', 'areaPref_txt', 'pref_nara');\">奈良県</a></li><li><a href=\"http://sftworks.jp/pref_wakayama\" onclick=\"ga('send', 'event', 'TOPPREF', 'areaPref_txt', 'pref_wakayama');\">和歌山県</a></li></ul>"
    
    var strTest2 = "hiratsukatesteststestststststst"
    var strTest3 = "hiratsukatesteststestststststst_hiratsukatesteststestststststst_hiratsukatesteststestststststst_hiratsukatesteststestststststst"
    
    var aryTest:[String]!
    weak var delegate:SegmentedTabVCLDelegate?
    
    /**
     xibを読み込む
     */
    override func loadView() {
        if let view = UINib(nibName: "SecondVCL", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        aryTest = [strTest1,strTest2,strTest3,strTest3,strTest2,strTest1,strTest1,strTest1,strTest2,strTest3,strTest3,strTest2,strTest1,strTest1,strTest2]
        
        var nib  = UINib(nibName: "FirstCustomCell", bundle:nil)
        menuView.registerNib(nib, forCellReuseIdentifier:"FirstCustomCell")
        
        nib = UINib(nibName: "SecondCustomCell", bundle:nil)
        menuView.registerNib(nib, forCellReuseIdentifier:"SecondCustomCell")
        
        nib = UINib(nibName: "ThirdCustomCell", bundle:nil)
        menuView.registerNib(nib, forCellReuseIdentifier:"ThirdCustomCell")
        
        nib = UINib(nibName: "ForthCustomCell", bundle:nil)
        menuView.registerNib(nib, forCellReuseIdentifier:"ForthCustomCell")
        
        nib = UINib(nibName: "TestTableViewCell", bundle:nil)
        menuView.registerNib(nib, forCellReuseIdentifier:"TestTableViewCell")
        
        // Do any additional setup after loading the view.
        self.menuView.estimatedRowHeight = 44
        self.menuView.rowHeight = UITableViewAutomaticDimension
        
//        // single swipe down
//        let swipeDownGestureLeft: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "handleSwipeLeft:")
//        swipeDownGestureLeft.numberOfTouchesRequired = 1
//        swipeDownGestureLeft.direction = UISwipeGestureRecognizerDirection.Left
//        self.menuView.addGestureRecognizer(swipeDownGestureLeft)
//        
//        // single swipe down
//        let swipeDownGestureRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "handleSwipeRight:")
//        swipeDownGestureRight.numberOfTouchesRequired = 1
//        swipeDownGestureRight.direction = UISwipeGestureRecognizerDirection.Right
//        self.menuView.addGestureRecognizer(swipeDownGestureRight)
        
        // Do any additional setup after loading the view.
    }
    
    func handleSwipeLeft(sender: UITapGestureRecognizer){
        self.delegate?.changePage(2)
    }
    
    func handleSwipeRight(sender: UITapGestureRecognizer){
        self.delegate?.changePage(0)
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
        if indexPath.section != 15{
            
            var cell_height:CGFloat = 0
            let text_height = TestTableViewCell.heightForTestLabel(menuView, strText:aryTest[indexPath.section])
            cell_height = 15+text_height
            dic_height.setValue(cell_height, forKey: String(indexPath.row))
            
            return cell_height
            
            
        }else{
            return 45
        }
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section != 15{
            guard let cell_height = dic_height.objectForKey(String(indexPath.section)) as? CGFloat else{
                return 45
            }
            return cell_height
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
        
        if indexPath.section != 15{
            
            let cell: TestTableViewCell = tableView.dequeueReusableCellWithIdentifier("TestTableViewCell") as! TestTableViewCell
            cell.testLabel.text = aryTest[indexPath.section]
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
            
//            if indexPath.row == aryMutablle15.count{
//                
//                self.delegate?.setScrollViewHeight(self.menuView.contentSize.height)
//            }
            
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        self.menuView.layoutIfNeeded()
//        print(self.menuView.contentSize.height)
//        self.delegate?.setScrollViewHeight(self.menuView.contentSize.height)
//        
//        
//        print(self.menuView.contentSize.height)
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
