//
//  SegmentedTabVCL.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/03/23.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

public protocol SegmentedTabVCLDelegate : class {
    
    func changeVCLBySwipe()
}


class SegmentedTabVCL: UIViewController,SegmentedTabVCLDelegate {

    @IBOutlet weak var pageCtrl: UISegmentedControl!
    @IBOutlet weak var pageView: UIView!
    @IBOutlet weak var toolnavbar: UIView!
    var currentvcl:UIViewController!
    var aryvcl:[UIViewController] = []
    var selectedSegmentdNumber:Int = -1
    var navBelowImageView:UIImageView! = nil
    
    var first:FirstVCL! = nil
    var second:SecondVCL! = nil
    var third:ThirdVCL! = nil
    
    var isVerticalOK = true
    
    let DIRECTION_NOTHING   = 0
    let DIRECTION_LEFT      = 1
    let DIRECTION_RIGHT     = 2
    
    /**
     xibを読み込む
     */
    override func loadView() {
        if let view = UINib(nibName: "SegmentedTabVCL", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
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
        
        self.pageCtrl.addTarget(self, action: "changevcl:", forControlEvents: UIControlEvents.ValueChanged)
        
        
    }
    
    func setupViewControllers(){
        
        first = self.storyboard?.instantiateViewControllerWithIdentifier("firstvcl") as! FirstVCL
        second = self.storyboard?.instantiateViewControllerWithIdentifier("secondvcl") as! SecondVCL
        second.delegate = self
        third = self.storyboard?.instantiateViewControllerWithIdentifier("thirdvcl") as! ThirdVCL
        
        aryvcl = [first,second,third]
        
        
        
    }
    
    func changeSegmentedControlValue(index: Int = -1,direction:Int = 0){
        
        if index != -1 {
            self.pageCtrl.selectedSegmentIndex = index
        }
        
        if currentvcl != nil{
            currentvcl.willMoveToParentViewController(nil)
            currentvcl.view.removeFromSuperview()
            currentvcl.removeFromParentViewController()
        }
        
        let nextvcl = self.aryvcl[self.pageCtrl.selectedSegmentIndex]
        nextvcl.view.frame = self.pageView.bounds
        
        switch direction{
        case DIRECTION_NOTHING:
            self.pageView.addSubview(nextvcl.view)
            break
        case DIRECTION_LEFT:
            
            //デフォではないので、自分でアニメーションを定義
            nextvcl.view.frame = CGRect(x: self.view.frame.width, y: self.pageView.frame.origin.y, width: self.view.frame.width, height: self.pageView.frame.height)
            self.pageView.addSubview(nextvcl.view)
            UIView.animateWithDuration(
                0.5,
                animations: { [weak self] () -> Void in
                    nextvcl.view.frame.origin.x = 0
                },
                completion: { [weak self] finished in
                })
            
            
            break
        case DIRECTION_RIGHT:
            nextvcl.view.frame = CGRect(x: -self.view.frame.width, y: self.pageView.frame.origin.y, width: self.view.frame.width, height: self.pageView.frame.height)
            self.pageView.addSubview(nextvcl.view)
            UIView.animateWithDuration(
                0.5,
                animations: { [weak self] () -> Void in
                    nextvcl.view.frame.origin.x = self!.view.frame.width
                },
                completion: { [weak self] finished in
                })
            break
        default:
            self.pageView.addSubview(nextvcl.view)
            break
        }
        
        
        
        nextvcl.didMoveToParentViewController(self)
        self.currentvcl = nextvcl
        
        self.addChildViewController(nextvcl)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / scrollView.frame.size.width
        self.pageCtrl.selectedSegmentIndex = Int(index)
        
        changeSegmentedControlValue(Int(index))
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupViewControllers()
        changeSegmentedControlValue()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    

    
    @IBAction func changevcl(sender: AnyObject) {
        
        changeSegmentedControlValue()
    }
    
    func changeVCLBySwipe() {
        
        
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
