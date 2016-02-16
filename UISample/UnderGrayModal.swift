//
//  UnderGrayModal.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/16.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class UnderGrayModal: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var infoView: UIView!
    
    class func instance() -> UnderGrayModal {
        return UINib(nibName: "UnderGrayModal", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! UnderGrayModal
        
    }
    
//    override func awakeFromNib() {
//        let view = NSBundle.mainBundle().loadNibNamed("UnderGrayModal", owner: self, options: nil).first as! UIView
//        addSubview(view)
//    }
    
    func initColor(){
        self.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5)
    }
    
    
    @IBAction func closeModal(sender: AnyObject) {
        
        UIView.animateWithDuration(
            0.5,
            animations: { [weak self] () -> Void in
                self?.frame.origin.y = UIScreen.mainScreen().bounds.height
            },
            completion: { [weak self] finished in
                self?.removeFromSuperview()
            })
        
    }

}
