//
//  TextViewInCell.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/03/08.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit


public protocol TextViewInCellDelegate : class {
    
    func reloadCell(cellHeight:CGFloat,strLastText:String)
}

class TextViewInCell: UITableViewCell,UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    var lastContentSize:CGRect = CGRectZero
    weak var delegate:TextViewInCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textView.delegate = self
        lastContentSize = textView.frame
    }
    
    func textViewDidChange(textView: UITextView){
        
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        textView.frame = newFrame
        
        var nowFrame = newFrame
        let lastHeight = lastContentSize.size.height
        //以下の30はフォントで調節da
        nowFrame.size.height += 30
        let nowHeight = nowFrame.size.height
        
        
        if nowHeight > lastHeight{
            
            lastContentSize = nowFrame
            textView.frame.size = lastContentSize.size
            let lastText = textView.text
            self.delegate?.reloadCell(lastContentSize.height,strLastText: lastText)
//            textView.layoutIfNeeded()
//            self.layoutIfNeeded()
            
            
        }
        
    }
    
    func setTextViewData(cellHeight:CGFloat,strAlready:String = ""){
        self.textView.text = strAlready
        lastContentSize.size.height = cellHeight
//        if strAlready != ""{
//            textView.becomeFirstResponder()
//            
//            let range = textView.selectedTextRange
//            let position = textView.positionFromPosition((range?.start)!, offset: 0)
//            
//            if position != nil{
//                textView.selectedTextRange = textView.textRangeFromPosition(position!, toPosition: position!)
//            }
//        }
    }
    

    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if textView.text != ""{
            textView.becomeFirstResponder()
            
            let range = textView.selectedTextRange
            let position = textView.positionFromPosition((range?.start)!, offset: 0)
            
            if position != nil{
                textView.selectedTextRange = textView.textRangeFromPosition(position!, toPosition: position!)
            }
        }
        
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
