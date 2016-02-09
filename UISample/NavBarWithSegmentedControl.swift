//
//  NavBarWithSegmentedControl.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/09.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class NavBarWithSegmentedControl: UINavigationBar {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    let segmentedControl:UISegmentedControl! = nil
    
    override func sizeThatFits(size: CGSize) -> CGSize {
        
        if segmentedControl != nil{
            let navbarSize = super.sizeThatFits(size)
            
            let segSize = 38
            navbarSize.height += segSize
            
            return navbarSize
        }else{
            return super.sizeThatFits(size)
        }
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if segmentedControl != nil{
            let btnSizeHeight = 28
            self.segmentedControl.frame = CGRect(x: 0, y: 44, width: self.bounds.size.width, height: btnSizeHeight)
        }
        
        
    }
    
    func setCustomSeg(customSeg:UISegmentedControl){
        
        segmentedControl.removeFromSuperview()
        segmentedControl = customSeg
        
        self.addSubview(segmentedControl)
        
        self.invalidateIntrinsicContentSize()
        self.setNeedsLayout()
        
    }
    
}
