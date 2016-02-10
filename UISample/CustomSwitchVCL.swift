//
//  CustomSwitchVCL.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/09.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class CustomSwitchVCL: UIViewController {

    @IBOutlet weak var menuView: UITableView!
    
    let aryData = [["title":"aaa","value":true]
                    ,["title":"bbb","value":false]
                    ,["title":"ccc","value":true]
                    ]
    
    /**
     xibを読み込む
     */
    override func loadView() {
        if let view = UINib(nibName: "CustomSwitchVCL", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib  = UINib(nibName: "SwitchWithCell", bundle:nil)
        self.menuView.registerNib(nib, forCellReuseIdentifier:"SwitchWithCell")
        
        
        // Do any additional setup after loading the view.
    }
    
    /*
    * セクション数を指定する
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.aryData.count
        
        
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 40
    }
    
    
    
    /*
    * Cellに値を設定する.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: SwitchWithCell = tableView.dequeueReusableCellWithIdentifier("SwitchWithCell") as! SwitchWithCell
        
        let dic = self.aryData[indexPath.row]
        
        cell.setData(dic, atIndexPath: indexPath)
        
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
