//
//  TestTableViewCell.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/24.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var testLabel: RTLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    func setData(atIndexPath:NSIndexPath,dicData:NSDictionary){
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textLabel!.preferredMaxLayoutWidth = CGRectGetWidth(self.bounds)
        
    }
    
    /**
     文字列の高さを計算して、セルの幅をいい感じに決めてくれるメソッド
     
     - parameter tableView: <#tableView description#>
     - parameter strText:   <#strText description#>
     
     - returns: <#return value description#>
     */
    class func heightForTestLabel(tableView: UITableView, strText:String) -> CGFloat {
        struct Sizing {
            static var cell: TestTableViewCell?
        }
        if Sizing.cell == nil {
            Sizing.cell = tableView.dequeueReusableCellWithIdentifier("TestTableViewCell") as? TestTableViewCell
        }
        if let cell = Sizing.cell {
            cell.frame.size.width = CGRectGetWidth(tableView.bounds)
            cell.textLabel?.numberOfLines = 0
            
            var strChangeText = strText
            
            let pattern = "<(\"[^\"]*\"|\'[^\']*\'|[^\'\">])*>"
            let content:NSString = strText
            
            let all = NSRange(location: 0, length: content.length)
            
            do {
                let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions.CaseInsensitive)
                regex.enumerateMatchesInString(content as String, options: NSMatchingOptions(rawValue: 0), range: all) {
                    (result : NSTextCheckingResult?, _, _) in
                    let theResult = content.substringWithRange(result!.range)
                    strChangeText = strChangeText.stringByReplacingOccurrencesOfString(theResult, withString: "")
                }
                
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }
            
            
            cell.textLabel!.text = strChangeText
            cell.layoutIfNeeded()
            let size = cell.textLabel!.intrinsicContentSize()
            return size.height
        }
        return 0
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
