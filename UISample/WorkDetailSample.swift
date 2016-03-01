//
//  WorkDetailSample.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/26.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit
import WebKit

class WorkDetailSample: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var detailView: UITableView!
    
    let arySection = ["バイト概要","応募状況","詳細情報","応募者には見えない情報","募集(採用予定)人数","管理用タイトル","メモ","メール設定","採用連絡先アドレス","応募者へのメッセージ","プレビューでは表示されない設定情報","勤務先公開の有無","勤務先地図の表示","勤務先名称（カナ）","有料オプション","採用連絡先電話番号","料金区分"]
    
    var dicHeight:NSMutableDictionary = NSMutableDictionary()
    
    var strTest2 = "hiratsukatesteststestststststst"
    var strTest3 = "hiratsukatesteststestststststst_hiratsukatesteststestststststst_hiratsukatesteststestststststst_hiratsukatesteststestststststst"
    var strTest4 = "hiratsukatesteststestststststst_hiratsukatesteststestststststst_hiratsukatesteststestststststst_hiratsukatesteststeststststststhiratsukatesteststestststststst_hiratsukatesteststestststststst_hiratsukatesteststestststststst_hiratsukatesteststeststststststhiratsukatesteststestststststst_hiratsukatesteststestststststst_hiratsukatesteststestststststst_hiratsukatesteststestststststst"
    var dicTest:[Int:String]!
    
    var workInfoView:WKWebView!
    
    var pageSize:CGSize?
    
    func createWebView(){
        let webViewConfiguration = WKWebViewConfiguration()
        let wkusercontentcontroller = WKUserContentController()
        webViewConfiguration.userContentController = wkusercontentcontroller
        
        self.workInfoView = WKWebView(frame: CGRect(x: 8, y: 8, width: self.view.frame.width-16, height: self.view.frame.height-16), configuration: webViewConfiguration)
        self.workInfoView.navigationDelegate = self
        
    }
    
    /**
     xibを読み込む
     */
    override func loadView() {
        if let view = UINib(nibName: "WorkDetailSample", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.detailView.estimatedRowHeight = 44
        self.detailView.rowHeight = UITableViewAutomaticDimension
        
        var nib  = UINib(nibName: "MutableHeightCell", bundle:nil)
        detailView.registerNib(nib, forCellReuseIdentifier:"MutableHeightCell")
        
        nib  = UINib(nibName: "WorkDetailItemCell", bundle:nil)
        detailView.registerNib(nib, forCellReuseIdentifier:"WorkDetailItemCell")
        
        nib  = UINib(nibName: "SummaryCell", bundle:nil)
        detailView.registerNib(nib, forCellReuseIdentifier:"SummaryCell")
        
        nib  = UINib(nibName: "WorkViewCell", bundle:nil)
        detailView.registerNib(nib, forCellReuseIdentifier:"WorkViewCell")
        
        nib  = UINib(nibName: "LinkCell", bundle:nil)
        detailView.registerNib(nib, forCellReuseIdentifier:"LinkCell")
        
        
        dicTest = [
            4:strTest2
            ,5:strTest3
            ,6:strTest4
            ,8:strTest2
            ,9:strTest3
            ,10:strTest4
            ,11:strTest2
            ,12:strTest3
            ,13:strTest4
            ,14:strTest2
            ,15:strTest3
            ,16:strTest4
                    ]
        
        //webviewを作成
        createWebView()
        
        let URL = NSURL(string: "https://shotworks.jp")
        let urlRequest: NSURLRequest = NSURLRequest(URL: URL!)
        self.workInfoView.loadRequest(urlRequest)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.workInfoView.frame.size.width = self.view.frame.size.width-16
    }
    
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!){
        // インジケータを表示する
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!){
        // インジケータを表示する
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
        
        pageSize = webView.scrollView.contentSize
        
        
        let indexpath = NSIndexPath(forRow: 0, inSection: 2)
        
        self.detailView.beginUpdates()
        self.detailView.reloadRowsAtIndexPaths([indexpath], withRowAnimation: UITableViewRowAnimation.None)
        self.detailView.endUpdates()
        
        
        
    }
    
    
    /*
    * セクション数を指定する
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return arySection.count
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 6
        case 2:
            return 1
        case 3:
            return 0
        case 4:
            return 1
        case 5:
            return 1
        case 6:
            return 1
        case 7:
            return 0
        case 8:
            return 1
        case 9:
            return 1
        case 10:
            return 1
        case 11:
            return 1
        case 12:
            return 1
        case 13:
            return 1
        case 14:
            return 1
        case 15:
            return 1
        case 16:
            return 1
            
        default:
            return 0
        }
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        switch indexPath.section {
        case 0:
            return 65
        case 1:
            return 45
        case 2:
            
            if pageSize != nil{
               return (pageSize?.height)!
            }else{
                return 500
            }
        case 3:
            return 0
        case (4...6):
            var cell_height:CGFloat = 0
            let text_height = MutableHeightCell.heightForLabel(detailView, strText:dicTest[indexPath.section]!)
            cell_height = 30+text_height
            return cell_height
        case 7:
            return 0
        case (8...16):
            var cell_height:CGFloat = 0
            let text_height = MutableHeightCell.heightForLabel(detailView, strText:dicTest[indexPath.section]!)
            cell_height = 30+text_height
            return cell_height
            
        default:
            return 0
        }
    }
    
    
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = PaddingLabel(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().applicationFrame.size.width, height: 20))
        label.font = UIFont(name: "HiraKakuProN-W6", size: 12.0)
        
        if arySection.count > section{
            label.text = arySection[section]
        }
        
        
        switch section {
        case 0:
            label.backgroundColor = UIColor.grayColor()
            break
        case 1:
            label.backgroundColor = UIColor.grayColor()
            break
        case 2:
            label.backgroundColor = UIColor.grayColor()
            break
        case 3:
            label.backgroundColor = UIColor.grayColor()
            break
        case 4:
            label.backgroundColor = UIColor.grayColor()
            break
        case 5:
            label.backgroundColor = UIColor.grayColor()
            break
        case 6:
            label.backgroundColor = UIColor.grayColor()
            break
        case 7:
            label.backgroundColor = UIColor.grayColor()
            break
        case 8:
            label.backgroundColor = UIColor.grayColor()
            break
        case 9:
            label.backgroundColor = UIColor.grayColor()
            break
        case 10:
            label.backgroundColor = UIColor.grayColor()
            break
        case 11:
            label.backgroundColor = UIColor.grayColor()
            break
        case 12:
            label.backgroundColor = UIColor.grayColor()
            break
        case 13:
            label.backgroundColor = UIColor.grayColor()
            break
        case 14:
            label.backgroundColor = UIColor.grayColor()
            break
        case 15:
            label.backgroundColor = UIColor.grayColor()
            break
        case 16:
            label.backgroundColor = UIColor.grayColor()
            break
            
        default:
            break
        }
        
        
        return label
        
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 16{
            let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().applicationFrame.size.width, height: 50))
            return view
        }else{
            return nil
        }
        
    }
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        
        switch section {
        case 0:
            return 35
        case 1:
            return 35
        case 2:
            return 35
        case 3:
            return 35
        case 4:
            return 30
        case 5:
            return 30
        case 6:
            return 30
        case 7:
            return 35
        case 8:
            return 30
        case 9:
            return 30
        case 10:
            return 30
        case 11:
            return 30
        case 12:
            return 30
        case 13:
            return 30
        case 14:
            return 30
        case 15:
            return 30
        case 16:
            return 30
            
        default:
            return 30
        }
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        if section == 16{
            return 50
        }else{
            return CGFloat.min
        }
        
    }
    
    /*
    * Cellに値を設定する.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 0:
            let cell0: SummaryCell = tableView.dequeueReusableCellWithIdentifier("SummaryCell") as! SummaryCell
            return cell0
        case 1:
            
            
            if indexPath.row == 0{
                let cell1: WorkDetailItemCell = tableView.dequeueReusableCellWithIdentifier("WorkDetailItemCell") as! WorkDetailItemCell
                cell1.titleLabel.text = "募集人数"
                cell1.itemLabel.text = "1人"
                return cell1
                
            }else if indexPath.row == 1{
                let cell1: WorkDetailItemCell = tableView.dequeueReusableCellWithIdentifier("WorkDetailItemCell") as! WorkDetailItemCell
                cell1.titleLabel.text = "プロフィール確認"
                cell1.itemLabel.text = "1人"
                return cell1
                
            }else if indexPath.row == 2{
                let cell1: WorkDetailItemCell = tableView.dequeueReusableCellWithIdentifier("WorkDetailItemCell") as! WorkDetailItemCell
                cell1.titleLabel.text = "NG連絡"
                cell1.itemLabel.text = "1人"
                return cell1
                
            }else if indexPath.row == 3{
                let cell1: WorkDetailItemCell = tableView.dequeueReusableCellWithIdentifier("WorkDetailItemCell") as! WorkDetailItemCell
                cell1.titleLabel.text = "辞退"
                cell1.itemLabel.text = "1人"
                return cell1
                
            }else if indexPath.row == 4{
                let cell1: WorkDetailItemCell = tableView.dequeueReusableCellWithIdentifier("WorkDetailItemCell") as! WorkDetailItemCell
                cell1.titleLabel.text = "累積応募人数"
                cell1.itemLabel.text = "1人"
                return cell1
                
            }else{
                let cell3: LinkCell = tableView.dequeueReusableCellWithIdentifier("LinkCell") as! LinkCell
                cell3.linkLabel.text = "このバイトの応募者一覧 ＞"
                return cell3
            }
            
            
            
        case 2:
            let cell2: WorkViewCell = tableView.dequeueReusableCellWithIdentifier("WorkViewCell") as! WorkViewCell
            
            if pageSize != nil{
                cell2.setWebView(workInfoView, pageSize: pageSize!)
            }
            
            return cell2
//        case 3:
//            return 35
        case (4...6):
            let cell: MutableHeightCell = tableView.dequeueReusableCellWithIdentifier("MutableHeightCell") as! MutableHeightCell
            let strText = dicTest[indexPath.section]!
            cell.setCellText(strText)
            return cell
        
//        case 7:
//            return 35
        case (8...16):
            let cell: MutableHeightCell = tableView.dequeueReusableCellWithIdentifier("MutableHeightCell") as! MutableHeightCell
            let strText = dicTest[indexPath.section]!
            cell.setCellText(strText)
            return cell
        
            
        default:
            let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "UITableViewCell")
            return cell
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
