//
//  SegmentedTabVCL.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/03/23.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

public protocol SegmentedTabVCLDelegate : class {
    
    func setScrollViewHeight(height:CGFloat)
    func changePage(index:Int)
}


class SegmentedTabVCL: UIViewController,SegmentedTabVCLDelegate,UIScrollViewDelegate {

    @IBOutlet weak var pageCtrl: UISegmentedControl!
    @IBOutlet weak var pageView: UIScrollView!
    @IBOutlet weak var toolnavbar: UIView!
    var currentvcl:UIViewController!
    var aryvcl:[UIViewController] = []
    var selectedSegmentdNumber:Int = -1
    var navBelowImageView:UIImageView! = nil
    
    var first:FirstVCL! = nil
    var second:SecondVCL! = nil
    var third:ThirdVCL! = nil
    
    
    
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
        first.delegate = self
        second = self.storyboard?.instantiateViewControllerWithIdentifier("secondvcl") as! SecondVCL
        second.delegate = self
        third = self.storyboard?.instantiateViewControllerWithIdentifier("thirdvcl") as! ThirdVCL
        third.delegate = self
        
        aryvcl = [first,second,third]
        
        var x:CGFloat = 0
        first.view.frame.origin = CGPoint(x: x, y: 0)
        first.view.frame.size = UIScreen.mainScreen().bounds.size
        
        x += UIScreen.mainScreen().bounds.size.width
        x += UIScreen.mainScreen().bounds.size.width
        
        pageView.addSubview(first.view)
        
        pageView.contentSize.width = x+UIScreen.mainScreen().bounds.size.width
        pageView.contentSize.height = 1800
    }
    
    func changeSegmentedControlValue(index: Int = -1){
        
        if index != -1 {
            self.pageCtrl.selectedSegmentIndex = index
        }
        
        if currentvcl != nil{
            currentvcl.willMoveToParentViewController(nil)
            currentvcl.view.removeFromSuperview()
            currentvcl.removeFromParentViewController()
        }
        
        let nextvcl = self.aryvcl[self.pageCtrl.selectedSegmentIndex]
        
        if let frontvcl = nextvcl as? FirstVCL{
            frontvcl.view.frame.origin = CGPoint(x: 0, y: 0)
            frontvcl.view.frame.size = CGSizeMake(CGRectGetWidth(view.bounds), CGRectGetHeight(pageView.bounds))
            
            pageView.addSubview(frontvcl.view)
        }else if let frontvcl = nextvcl as? SecondVCL{
            var x:CGFloat = 0
            x += UIScreen.mainScreen().bounds.size.width
            frontvcl.view.frame.origin = CGPoint(x: x, y: 0)
            frontvcl.view.frame.size = CGSizeMake(CGRectGetWidth(view.bounds), CGRectGetHeight(pageView.bounds))
            pageView.addSubview(frontvcl.view)
            
        }else if let frontvcl = nextvcl as? ThirdVCL{
            var x:CGFloat = 0
            x += UIScreen.mainScreen().bounds.size.width
            x += UIScreen.mainScreen().bounds.size.width
            frontvcl.view.frame.origin = CGPoint(x: x, y: 0)
            frontvcl.view.frame.size = CGSizeMake(CGRectGetWidth(view.bounds), CGRectGetHeight(pageView.bounds))
            pageView.addSubview(frontvcl.view)
        }
        
        
        nextvcl.didMoveToParentViewController(self)
        self.currentvcl = nextvcl
        
//        print(pageView.contentOffset.x)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / scrollView.frame.size.width
        self.pageCtrl.selectedSegmentIndex = Int(index)
        
        changeSegmentedControlValue(Int(index))
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupViewControllers()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func setScrollViewHeight(height: CGFloat) {
        
        pageView.contentSize.height = height
    }
    
    func changePage(index: Int) {
        self.pageCtrl.selectedSegmentIndex = index
        let contentsOffsetX = pageView.frame.size.width*CGFloat(self.pageCtrl.selectedSegmentIndex)
        let point = CGPoint(x: contentsOffsetX, y: 0)
        pageView.setContentOffset(point, animated: true)
        changeSegmentedControlValue()
    }
    
    @IBAction func changevcl(sender: AnyObject) {
        let contentsOffsetX = pageView.frame.size.width*CGFloat(self.pageCtrl.selectedSegmentIndex)
        let point = CGPoint(x: contentsOffsetX, y: 0)
        pageView.setContentOffset(point, animated: true)
//        print(pageView.contentOffset.x)
        changeSegmentedControlValue()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if let forntvcl = currentvcl as? SecondVCL{
            return
        }
        scrollView.contentOffset.y = 0.0
        
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
