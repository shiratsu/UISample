//
//  ModalVCL.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/18.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class ModalVCL: UIViewController {

    
    /**
     xibを読み込む
     */
    override func loadView() {
        if let view = UINib(nibName: "ModalVCL", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.6)
        // Do any additional setup after loading the view.
    }
    @IBAction func closeModal(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
