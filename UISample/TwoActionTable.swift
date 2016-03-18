//
//  TwoActionTable.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/03/17.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class TwoActionTable: UIViewController,TwoActionCellDelegate {

    @IBOutlet weak var twoTable: UITableView!
    
    /**
     xibを読み込む
     */
    override func loadView() {
        if let view = UINib(nibName: "TwoActionTable", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib  = UINib(nibName: "TwoActionCell", bundle:nil)
        twoTable.registerNib(nib, forCellReuseIdentifier:"TwoActionCell")

        // Do any additional setup after loading the view.
    }
    
    /*
    * セクション数を指定する
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 79
    }
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().applicationFrame.size.width, height: 30))
        label.text = "２つのアクションを持ったセル"
        return label
        
    }
    
    
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        
        return 30
    }
    
    
    
    
    
    /*
    * Cellに値を設定する.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: TwoActionCell = tableView.dequeueReusableCellWithIdentifier("TwoActionCell") as! TwoActionCell
        cell.indexPath = indexPath
        cell.setUPAction()
        cell.delegate = self
        return cell
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func actionFirst(index:Int){
        self.performSegueWithIdentifier("show_first", sender: self)
    }
    func actionSecond(index:Int){
        let FirstVCL = self.storyboard!.instantiateViewControllerWithIdentifier("FirstAction") as! FirstAction
        let SecondVCL = self.storyboard!.instantiateViewControllerWithIdentifier("SecondAction") as! SecondAction
        
        FirstVCL.workid = "aaaa"
        
        let ary_controllers = self.navigationController?.viewControllers
        let controllers = NSMutableArray(array: ary_controllers!)
        
        controllers.addObject(FirstVCL)
        controllers.addObject(SecondVCL)
        
        self.navigationController?.setViewControllers(controllers.copy() as! [UIViewController], animated: true)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let vcl = segue.destinationViewController as! FirstAction
        vcl.workid = "aaaa"
    }
    

}
