//
//  WorkViewCell.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/26.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit
import WebKit

class WorkViewCell: UITableViewCell {

    @IBOutlet weak var webIndicator: UIActivityIndicatorView!
    var isAlreadyLoad = false
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        webIndicator.startAnimating()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setWebView(webView:WKWebView,pageSize:CGSize){
        
        if !isAlreadyLoad{
            webIndicator.stopAnimating()
            webIndicator.hidden = true
            webView.frame = CGRect(x: 8, y: 8, width: pageSize.width, height: pageSize.height)
            webView.scrollView.scrollEnabled = false
            self.addSubview(webView)
            isAlreadyLoad = true
        }
        
    }
    
    
}
