//
//  addingTasks.swift
//  twoFactorAuthentication
//
//  Created by Jose on 4/20/16.
//  Copyright © 2016 jose. All rights reserved.
//

import Foundation
import UIKit

var array1:[String] =  [String]()


class addingTaks: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var addEmail: myTextField!
    
    @IBOutlet weak var addPassword: myTextField!
    
    
    override func viewDidLoad() {
        addEmail.attributedPlaceholder = NSAttributedString(string: "Enter email", attributes:[NSForegroundColorAttributeName: UIColor(red:0.40, green:0.25, blue:0.45, alpha:1)])
        
        addEmail.textColor = UIColor(red:0.40, green:0.25, blue:0.45, alpha:1)
        
        addPassword.attributedPlaceholder = NSAttributedString(string: "Enter password", attributes:[NSForegroundColorAttributeName: UIColor(red:0.40, green:0.25, blue:0.45, alpha:1)])
        
        addPassword.textColor = UIColor(red:0.40, green:0.25, blue:0.45, alpha:1)
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("Array") != nil ) {
        array1 = NSUserDefaults.standardUserDefaults().objectForKey("Array") as! NSArray as! [String]
        }
    }
    
    var array:[String] = [String]()
    
    
    
    @IBAction func actionPressed(sender: AnyObject) {
        
        array1.append(addEmail.text!)
        
        NSUserDefaults.standardUserDefaults().setObject(array1, forKey: "Array")
        
        
        if (NSUserDefaults.standardUserDefaults().stringForKey("Array") != nil){
         array1  =  NSUserDefaults.standardUserDefaults().objectForKey("Array")! as! NSArray as! [String]
        }
        //array1.append(array[sender.tag])
        NSUserDefaults.standardUserDefaults().setObject(array1, forKey: "Array")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        print(NSUserDefaults.standardUserDefaults().objectForKey("Array"))
    }
    
}