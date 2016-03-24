//
//  ThirdVCL.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/03/24.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class ThirdVCL: UIViewController {
    
    /**
     xibを読み込む
     */
    override func loadView() {
        if let view = UINib(nibName: "ThirdVCL", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
