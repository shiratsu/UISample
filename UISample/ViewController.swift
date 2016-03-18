//
//  ViewController.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/08.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class ViewController: UIViewController,AlertActionControllerDelegate {

    
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
        
        //右のボタン
        let cond_change_btn = showButton("右ボタン", width: 70, height: 50)
        cond_change_btn.addTarget(self, action: "showMenu:", forControlEvents: UIControlEvents.TouchUpInside)
        let right_btn = UIBarButtonItem(customView: cond_change_btn)
        
        //backButton.tintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        self.navigationItem.setRightBarButtonItem(right_btn, animated: true)
    }
    
    func showButton(titlestr :String,width:Int,height:Int) -> UIButton{
        let myButton: UIButton = UIButton(frame: CGRectMake(0, 0, CGFloat(width), CGFloat(height)))
        myButton.setTitle(titlestr, forState: UIControlState.Normal)
        myButton.titleLabel?.font = UIFont(name:"HiraKakuProN-W3",size:16)!
        myButton.titleLabel?.textAlignment = NSTextAlignment.Left
        return myButton
    }
    
    @IBAction func showMenu(sender: AnyObject) {
        
        self.performSegueWithIdentifier("show_alert_modal", sender: self)
        
    }
    
    @IBAction func gotoCustomnav(sender: AnyObject) {
        self.performSegueWithIdentifier("show_customnavbar", sender: self)
    }
    @IBAction func goSwitch(sender: AnyObject) {
        self.performSegueWithIdentifier("show_customswitch", sender: self)
    }
    
    
    @IBAction func gotoSimpleCalendar(sender: AnyObject) {
        self.performSegueWithIdentifier("show_simplecalendar", sender: self)
    }
    
    @IBAction func gotoLandCalendar(sender: AnyObject) {
        self.performSegueWithIdentifier("show_landcalendar", sender: self)
    }
    
    @IBAction func gotoVartivalCalendar(sender: AnyObject) {
        self.performSegueWithIdentifier("show_varticalcalendar", sender: self)
    }
    @IBAction func gotoLabelList(sender: AnyObject) {
        
        self.performSegueWithIdentifier("show_labellist", sender: self)
        
    }
    @IBAction func showModal(sender: AnyObject) {
        let grayModal = UnderGrayModal.instance()
        grayModal.initColor()
        grayModal.frame.origin.y = self.view.frame.size.height
        grayModal.frame.size.width = self.view.frame.width
        self.view.addSubview(grayModal)
        UIView.animateWithDuration(
            0.5,
            animations: { [weak self] () -> Void in
                grayModal.frame.origin.y = self!.view.frame.origin.y
            },
            completion: {finished in
                
            })
        
    }
    
    @IBAction func gotoKeyboard(sender: AnyObject) {
        self.performSegueWithIdentifier("show_keyboard", sender: self)
    }
    
    @IBAction func goto2linenav(sender: AnyObject) {
        self.performSegueWithIdentifier("show_twoline", sender: self)
    }
    
    @IBAction func gotoTableViewInCell(sender: AnyObject) {
        self.performSegueWithIdentifier("show_accordion", sender: self)
    }
    
    
    @IBAction func gotoModal2(sender: AnyObject) {
        self.performSegueWithIdentifier("show_modal", sender: self)
    }
    @IBAction func gotoAnotherCalendar(sender: AnyObject) {
        self.performSegueWithIdentifier("show_another_calendar", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func gotoHtml(sender: AnyObject) {
        self.performSegueWithIdentifier("show_html", sender: self)
    }
    @IBAction func gotoDetailSample(sender: AnyObject) {
        self.performSegueWithIdentifier("show_workdetail", sender: self)
    }
    
    @IBAction func gotoTextViewInCell(sender: AnyObject) {
        self.performSegueWithIdentifier("show_textviewincell", sender: self)
    }
    
    @IBAction func gotoAutoLayoutCell(sender: AnyObject) {
        self.performSegueWithIdentifier("show_autolayout_cell", sender: self)
    }
    
    
    @IBAction func showNormalAlert(sender: AnyObject) {
        //UIActionSheet
        let actionSheet:UIAlertController = UIAlertController(title:nil,
            message: nil,
            preferredStyle: UIAlertControllerStyle.Alert)
        
        
        
        let action1:UIAlertAction = UIAlertAction(title: "すべてのバイト",
            style: UIAlertActionStyle.Default,
            handler:{
                (action:UIAlertAction!) -> Void in
                print("すべてのバイト")
        })
        
        let action2:UIAlertAction = UIAlertAction(title: "募集中・選考中のバイト",
            style: UIAlertActionStyle.Default,
            handler:{
                (action:UIAlertAction!) -> Void in
                print("募集中・選考中のバイト")
        })
        
        
        let action3:UIAlertAction = UIAlertAction(title: "勤務待ちのバイト",
            style: UIAlertActionStyle.Default,
            handler:{
                (action:UIAlertAction!) -> Void in
                print("勤務待ちのバイト")
        })
        
        let action4:UIAlertAction = UIAlertAction(title: "勤務中のバイト",
            style: UIAlertActionStyle.Default,
            handler:{
                (action:UIAlertAction!) -> Void in
                print("勤務中のバイト")
        })
        
        let action5:UIAlertAction = UIAlertAction(title: "勤務終了のバイト",
            style: UIAlertActionStyle.Default,
            handler:{
                (action:UIAlertAction!) -> Void in
                print("勤務終了のバイト")
        })
        
        let action6:UIAlertAction = UIAlertAction(title: "キャンセル",
            style: UIAlertActionStyle.Default,
            handler:{
                (action:UIAlertAction!) -> Void in
                print("キャンセル")
        })
        
        //AlertもActionSheetも同じ
        actionSheet.addAction(action1)
        actionSheet.addAction(action2)
        actionSheet.addAction(action3)
        actionSheet.addAction(action4)
        actionSheet.addAction(action5)
        actionSheet.addAction(action6)
        
        self.presentViewController(actionSheet, animated: false, completion: nil)
    }
    
    @IBAction func showTwoActionCell(sender: AnyObject) {
        self.performSegueWithIdentifier("show_twoaction_table", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        
        if segue.identifier == "show_modal" {
            let svc = segue.destinationViewController as! ModalVCL
            svc.providesPresentationContextTransitionStyle = true
            svc.definesPresentationContext = true
            svc.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        }
        
        if segue.identifier == "show_alert_modal" {
            let svc = segue.destinationViewController as! AlertActionController
            svc.delegate = self
            svc.aryMenu = ["すべてのバイト","募集中・選考中のバイト","勤務待ちのバイト","勤務中のバイト","勤務終了のバイト","キャンセル"]
            svc.aryFont = [UIFont(name: "HiraKakuProN-W6", size: 14)!
                        ,UIFont(name: "HiraKakuProN-W3", size: 14)!
                        ,UIFont(name: "HiraKakuProN-W3", size: 14)!
                        ,UIFont(name: "HiraKakuProN-W3", size: 14)!
                        ,UIFont(name: "HiraKakuProN-W3", size: 14)!
                        ,UIFont(name: "HiraKakuProN-W3", size: 14)!
                            ]
            svc.aryColor = [UIColor.blackColor()
                ,UIColor.blueColor()
                ,UIColor.blueColor()
                ,UIColor.blueColor()
                ,UIColor.blueColor()
                ,UIColor.redColor()
            ]
            
            svc.providesPresentationContextTransitionStyle = true
            svc.definesPresentationContext = true
            svc.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        }
        
    }
    
    func selectMenu(index: Int) {
        print(index)
    }

}

