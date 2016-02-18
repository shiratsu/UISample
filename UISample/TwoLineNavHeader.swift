//
//  TwoLineNavHeader.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/17.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class TwoLineNavHeader: UIViewController {

    
    /**
     xibを読み込む
     */
    override func loadView() {
        if let view = UINib(nibName: "TwoLineNavHeader", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let multi_line_title = MultiLineTitleView.instance()
        multi_line_title.firstLine.text = "1行目"
        multi_line_title.secondLine.text = "2行目"
        // Do any additional setup after loading the view.
        
        let frame:CGRect? = self.navigationController?.navigationBar.frame
        if frame != nil{
            multi_line_title.frame.size.height = (frame?.height)!
        }
        
        self.navigationItem.titleView = multi_line_title
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
