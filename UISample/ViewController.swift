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
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        
        if segue.identifier == "show_modal" {
            let svc = segue.destinationViewController as! ModalVCL
            svc.providesPresentationContextTransitionStyle = true
            svc.definesPresentationContext = true
            svc.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        }
        
    }

}

