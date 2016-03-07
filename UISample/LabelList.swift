//
//  LabelList.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/03/07.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class LabelList: UIViewController {

    @IBOutlet weak var aaaLabel: UILabel!
    
    @IBOutlet weak var bbbLabel: UILabel!
    
    @IBOutlet weak var cccLabel: UILabel!
    
    @IBOutlet weak var dddLabel: UILabel!
    
    
    /**
     xibを読み込む
     */
    override func loadView() {
        if let view = UINib(nibName: "LabelList", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func first(sender: AnyObject) {
        aaaLabel.text = ""
    }
    
    @IBAction func second(sender: AnyObject) {
        bbbLabel.text = ""
    }
    
    
    @IBAction func third(sender: AnyObject) {
        cccLabel.text = ""
    }

    
    @IBAction func forth(sender: AnyObject) {
        dddLabel.text = ""
    }
    
    @IBAction func fifth(sender: AnyObject) {
        aaaLabel.text = "aaaaa"
        bbbLabel.text = "bbbbb"
        cccLabel.text = "cccccc"
        dddLabel.text = "ddddd"
        
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
