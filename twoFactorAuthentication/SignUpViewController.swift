//
//  SignUpViewController.swift
//  twoFactorAuthentication
//
//  Created by Jose on 4/19/16.
//  Copyright © 2016 jose. All rights reserved.
//

import UIKit
import Foundation

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailSignUp: myTextField!
    
    @IBOutlet weak var passwordSignUp: myTextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var existingUser: UIButton!
    
    override func viewDidLoad() {
        
        emailSignUp.attributedPlaceholder = NSAttributedString(string: "Enter email", attributes:[NSForegroundColorAttributeName: UIColor(red:0.40, green:0.25, blue:0.45, alpha:1)])
        
        emailSignUp.textColor = UIColor(red:0.40, green:0.25, blue:0.45, alpha:1)
        
        passwordSignUp.attributedPlaceholder = NSAttributedString(string: "Enter password", attributes:[NSForegroundColorAttributeName: UIColor(red:0.40, green:0.25, blue:0.45, alpha:1)])
    
        passwordSignUp.textColor = UIColor(red:0.40, green:0.25, blue:0.45, alpha:1)
        
        existingUser.tintColor = UIColor(red:0.40, green:0.25, blue:0.45, alpha:1)
    
    }
    

    
    
    @IBAction func registerAccount(registerButton: UIButton) {
        
        if(emailSignUp.text! == "")
        {
            showErrorAlert("Email Field is blank!", message: "Please enter your email")
        }
        else if(passwordSignUp.text! == ""){
            showErrorAlert("Password Field is blank", message: "Please enter your password")
        }
        else {
            let user = emailSignUp.text
            let password = passwordSignUp.text
            
            //Store the users registration
            NSUserDefaults.standardUserDefaults().setObject(user, forKey: "user")
            NSUserDefaults.standardUserDefaults().setObject(password, forKey: "password")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            //Display alert message with confirmation
            let alertController = UIAlertController(title: "Alert", message: "Registration successful. Thank you", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "Ok", style: .Default) { (action:UIAlertAction!) in
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            
            //@@
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "accountActive")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: false, completion:nil)
            
            
            
        }
    }
    
    
    //displaying error
    
    func showErrorAlert(title: String, message: String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action:UIAlertAction!) in
            
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "Ok", style: .Default) { (action:UIAlertAction!) in
            
        }
        alertController.addAction(OKAction)
        
        self.presentViewController(alertController, animated: true, completion:nil)
        

    
    }

}