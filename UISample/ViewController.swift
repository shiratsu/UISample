//
//  ViewController.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/08.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    /**
     xibを読み込む
     */
    override func loadView() {
        if let view = UINib(nibName: "ViewController", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func gotoCustomnav(sender: AnyObject) {
        self.performSegueWithIdentifier("show_customnavbar", sender: self)
    }
    @IBAction func goSwitch(sender: AnyObject) {
        self.performSegueWithIdentifier("show_customswitch", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

