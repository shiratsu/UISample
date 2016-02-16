//
//  KeyboardSample.swift
//  UISample
//
//  Created by 平塚 俊輔 on 2016/02/16.
//  Copyright © 2016年 平塚 俊輔. All rights reserved.
//

import UIKit

class KeyboardSample: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var keywordField: UITextField!
    
    //使用制限キーボード
    let ACCEPTABLE_CHARACTERS = " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_.@*+><,/?!_-=^~¥|`[{]}:;&%$#)('"
    
    
    /**
     xibを読み込む
     */
    override func loadView() {
        if let view = UINib(nibName: "KeyboardSample", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool{
        let inverseSet = NSCharacterSet(charactersInString:ACCEPTABLE_CHARACTERS).invertedSet
        
        // At every character in this "inverseSet" contained in the string,
        // split the string up into components which exclude the characters
        // in this inverse set
        let components = string.componentsSeparatedByCharactersInSet(inverseSet)
        
        // Rejoin these components
        let filtered = components.joinWithSeparator("")  // use join("", components) if you are using Swift 1.2
        
        // If the original string is equal to the filtered string, i.e. if no
        // inverse characters were present to be eliminated, the input is valid
        // and the statement returns true; else it returns false
        return string == filtered
        
        
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
