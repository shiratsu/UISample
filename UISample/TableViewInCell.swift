//
//  TableViewInCell.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/17.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

public protocol TableViewInCellDelegate : class {
    
    func gotoNext(strText:String)
}

class TableViewInCell: UITableViewCell {

    @IBOutlet weak var menuView: UITableView!
    dynamic var isActive = false
    var aryData:[String] = ["ccc","bbb","aaa"]
    
    weak var delegate:TableViewInCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addObserver(self, forKeyPath: "isActive", options: [.New, .Old], context: nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.isActive = false
        aryData = []
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isActive{
            return aryData.count
        }else{
            return 0
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 45
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "UITableViewCell")
        if isActive{
            cell.textLabel!.text = aryData[indexPath.row]
        }
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        
        return CGFloat.min
    }
    
    
    
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return CGFloat.min
        
    }
    
    /*
    Cellが選択された際に呼び出される.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if isActive && delegate != nil && aryData.count > indexPath.row{
            let strTest = aryData[indexPath.row]
            self.delegate.gotoNext(strTest)
            
        }
        
    }
    
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        print(keyPath) // Optional("prop")
        print(object) // Optional(<MyApp.MyClass: 0x7fdad1c013d0>)
        print(change) // Optional(["old": 0, "new": 10, "kind": 1])
        
        if keyPath == "isActive"{
//            let val = change!["new"] as! Bool
//            if val == false{
//                
//            }else{
//                
//            }
            menuView.reloadData()
        }
    }
    
    
    
    
    
    deinit {
        removeObserver(self, forKeyPath: "isActive")
    }

    
}
