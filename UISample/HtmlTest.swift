//
//  HtmlTest.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/18.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class HtmlTest: UIViewController,RTLabelDelegate{

    
    @IBOutlet weak var htmlLabel: RTLabel!
    
    /**
     xibを読み込む
     */
    override func loadView() {
        if let view = UINib(nibName: "HtmlTest", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let test = "テスト<a href='http://www.yahoo.co.jp/'>ヤフー</a>"
        htmlLabel.delegate = self
//        htmlLabel.text = test2
        
        // Do any additional setup after loading the view.
        htmlLabel.text = test
    }
    
    func rtLabel(rtLabel: AnyObject!, didSelectLinkWithURL url: NSURL!) {
        print(url)
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
