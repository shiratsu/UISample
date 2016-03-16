//
//  AlertActionController.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/03/16.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

public protocol AlertActionControllerDelegate : class {
    
    func selectMenu(index:Int)
}

class AlertActionController: UIViewController {

    @IBOutlet weak var alertMenu: UITableView!
    
    var aryMenu:[String]!
    var aryFont:[UIFont]!
    var aryColor:[UIColor]!
    
    weak var delegate:AlertActionControllerDelegate?
    
    
    /**
     xibを読み込む
     */
    override func loadView() {
        if let view = UINib(nibName: "AlertActionController", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.6)
        // Do any additional setup after loading the view.
        
        // 角丸
        self.alertMenu.layer.cornerRadius = 10.0
        
        let realHeight = 49*aryMenu.count
        
        let constraint = NSLayoutConstraint()
        constraint.identifier = "menuHeight"
        
        self.alertMenu.removeConstraint(constraint)
        
        //追加する
        let alertHeight = NSLayoutConstraint(
            item: self.alertMenu,
            attribute: NSLayoutAttribute.Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1.0,
            constant: CGFloat(realHeight))
        
        self.alertMenu.addConstraint(alertHeight)
        
    }
    
    /*
    * セクション数を指定する
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return aryMenu.count
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 49
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return CGFloat.min
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return CGFloat.min
        
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
        
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
        
    }
    /*
    Cellが選択された際に呼び出される.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        self.dismissViewControllerAnimated(false, completion: {
            [weak self] () -> Void in
            self?.delegate?.selectMenu(indexPath.row)
            })

    }
   
    
    /*
    * Cellに値を設定する.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "UITableViewCell")
        cell.textLabel?.textAlignment = NSTextAlignment.Center
        cell.textLabel?.font = aryFont[indexPath.row]
        cell.textLabel?.textColor = aryColor[indexPath.row]
        cell.textLabel?.text = aryMenu[indexPath.row]
        
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
