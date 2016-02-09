//
//  CustomNavbar.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/08.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class CustomNavbar: UIViewController {

    
    
    @IBOutlet weak var segmentedbar: UIToolbar!
    var navBelowImageView:UIImageView! = nil
    
    
    /**
     xibを読み込む
     */
    override func loadView() {
        if let view = UINib(nibName: "CustomNavbar", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        for aview in (self.navigationController?.navigationBar.subviews)!{
            
            for bview in aview.subviews{
                
                
                if let cview = bview as? UIImageView where cview.bounds.size.width == self.navigationController!.navigationBar.frame.size.width && cview.bounds.size.height < 2 {
                    self.navBelowImageView = cview
                }
                
            }
            
        }
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.moveHairLine(true)
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.moveHairLine(false)
    }
    
    private func moveHairLine(isAppear:Bool){
        var hairLineFrame = navBelowImageView.frame
        
        if isAppear{
            hairLineFrame.origin.y += segmentedbar.bounds.size.height
        }else{
            hairLineFrame.origin.y -= segmentedbar.bounds.size.height
        }
        navBelowImageView.frame = hairLineFrame
        
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
