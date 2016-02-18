    //
//  PaddingLabel.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/17.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class PaddingLabel: UILabel {

    // paddingの値
    let padding = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    
    override func drawTextInRect(rect: CGRect) {
        let newRect = UIEdgeInsetsInsetRect(rect, padding)
        super.drawTextInRect(newRect)
    }
    
    override func intrinsicContentSize() -> CGSize {
        var intrinsicContentSize = super.intrinsicContentSize()
        intrinsicContentSize.height += padding.top + padding.bottom
        intrinsicContentSize.width += padding.left + padding.right
        return intrinsicContentSize
    }

}
