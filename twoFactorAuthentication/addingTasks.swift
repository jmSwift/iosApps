//
//  addingTasks.swift
//  twoFactorAuthentication
//
//  Created by Jose on 4/20/16.
//  Copyright © 2016 jose. All rights reserved.
//

import Foundation
import UIKit

class addingTaks: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var addEmail: myTextField!
    
    @IBOutlet weak var addPassword: myTextField!
    
    
    override func viewDidLoad() {
        addEmail.attributedPlaceholder = NSAttributedString(string: "Enter email", attributes:[NSForegroundColorAttributeName: UIColor(red:0.40, green:0.25, blue:0.45, alpha:1)])
        
        addEmail.textColor = UIColor(red:0.40, green:0.25, blue:0.45, alpha:1)
        
        addPassword.attributedPlaceholder = NSAttributedString(string: "Enter password", attributes:[NSForegroundColorAttributeName: UIColor(red:0.40, green:0.25, blue:0.45, alpha:1)])
        
        addPassword.textColor = UIColor(red:0.40, green:0.25, blue:0.45, alpha:1)
        
    }
}