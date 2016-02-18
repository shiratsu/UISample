//
//  MultiLineTitleView.swift
//  shotworks_for_ph2_by_swift
//
//  Created by 平塚 俊輔 on 2015/11/30.
//  Copyright © 2015年 平塚 俊輔. All rights reserved.
//

import UIKit

class MultiLineTitleView: UIView {

    @IBOutlet weak var firstLine: UILabel!
    @IBOutlet weak var secondLine: UILabel!
    
    class func instance() -> MultiLineTitleView {
        return UINib(nibName: "MultiLineTitleView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! MultiLineTitleView
        
    }
    

}
