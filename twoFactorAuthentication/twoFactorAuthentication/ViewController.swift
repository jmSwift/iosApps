//
//  ViewController.swift
//  twoFactorAuthentication
//
//  Created by Jose on 4/14/16.
//  Copyright © 2016 jose. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController, UITextFieldDelegate {
    
    enum LAError : Int {
        case AuthenticationFailed
        case UserCancel
        case UserFallback
        case SystemCancel
        case PasscodeNotSet
        case TouchIDNotAvailable
        case TouchIDNotEnrolled
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: myButton!
    
    @IBOutlet weak var createAccount: UIButton!
    
    
    func authenticateUser() {
        let context : LAContext = LAContext()
        
        var error : NSError?
        let myLocalizedReasonString : String = "Authentication is required"
        
        if context.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            context.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString, reply: { (success : Bool, evaluationError : NSError?) -> Void in
            
                if success {
                    NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                        //self.loadData()------------------------------
                        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "fingerPrint")
                        NSUserDefaults.standardUserDefaults().synchronize()
                        
                        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn")
                        NSUserDefaults.standardUserDefaults().synchronize()
                        
                    })
                } else {
                    // Authentification failed
                    print(evaluationError?.localizedDescription)
                    
                    switch evaluationError!.code {
                    case LAError.SystemCancel.rawValue:
                        print("Authentication cancelled by the system")
                    case LAError.UserCancel.rawValue:
                        print("Authentication cancelled by the user")
                    case LAError.UserFallback.rawValue:
                        print("User wants to use a password")
                        // We show the alert view in the main thread (always update the UI in the main thread)
                        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                            self.showPasswordAlert()
                        })
                    default:
                        print("Authentication failed")
                        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                            self.showPasswordAlert()
                        })
                    }
                }
            })
            
           
            
        } else {
            switch error!.code {
            case LAError.TouchIDNotEnrolled.rawValue:
                print("TouchID not enrolled")
            case LAError.PasscodeNotSet.rawValue:
                print("Passcode not set")
            default:
                print("TouchID not available")
            }
            self.showPasswordAlert()
        }

    }
    
    func login(password: String){
        if password == NSUserDefaults.standardUserDefaults().stringForKey("password") {// && username ==  "jose" {
            //self.loadData()------------------------------------------
        } else {
            self.incorrectPasswordAlert()
        }
    }
    
    func incorrectPasswordAlert(){
        let alertController: UIAlertController = UIAlertController(title: "Invalid Password", message: "Please try again", preferredStyle:  .Alert)
        
        
        let cancelAction : UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
            self.login("false")
        }
        
        let doneAction : UIAlertAction = UIAlertAction(title: "Done", style: .Default) { (action) -> Void in
            let pwd = alertController.textFields![0] as UITextField
            //need this
            
            self.login(pwd.text!)
        }
        doneAction.enabled = false
        
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Password"
            textField.secureTextEntry = true
            
            NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: textField, queue: NSOperationQueue.mainQueue(), usingBlock: { (notification) -> Void in
                doneAction.enabled = textField.text != ""
            })
            
            alertController.addAction(cancelAction)
            alertController.addAction(doneAction)
            self.presentViewController(alertController, animated: true) {
                // if(alertController.)
            }
        }
        
    }
    
    func showPasswordAlert() {
        let alertController : UIAlertController = UIAlertController(title:"TouchID Demo" , message: "Please enter password", preferredStyle: .Alert)
        
        let cancelAction : UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
            self.login("false")
        }
        
        let doneAction : UIAlertAction = UIAlertAction(title: "Done", style: .Default) { (action) -> Void in
            let pwd = alertController.textFields![0] as UITextField
            //need this
            
            self.login(pwd.text!)
        }
        doneAction.enabled = false

         alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Password"
            textField.secureTextEntry = true
            
            NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: textField, queue: NSOperationQueue.mainQueue(), usingBlock: { (notification) -> Void in
               doneAction.enabled = textField.text != ""
            })
            
            alertController.addAction(cancelAction)
            alertController.addAction(doneAction)
            self.presentViewController(alertController, animated: true) {
               // if(alertController.)
            }
        }
        
    }
    /*
    func loadData(){
 
    }
    
    */
    
    
    @IBAction func loginButtonClicked(myButton:UIButton) {
        
        if emailTextField.text == "" {
            showErrorAlert("Email Field is blank", message: "Please enter your email")
        }
        else if passwordTextField.text == "" {
            showErrorAlert("Password Field is blank", message: "Please enter your password")
        }
        else {
            
            let userEmailStored = NSUserDefaults.standardUserDefaults().stringForKey("user")
            let passwordStored = NSUserDefaults.standardUserDefaults().stringForKey("password")
            
            
            if emailTextField.text == userEmailStored{
                if passwordTextField.text == passwordStored {
                    performSegueWithIdentifier("homePage", sender: nil)
                }
                else {
                    showErrorAlert("Invalid credentials", message: "Incorrect username/passowrd. try again")
                }
            }else {
                showErrorAlert("Invalid credentials", message: "Incorrect username/passowrd. try again")            }
        }
    
    }
    
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
    
    @IBAction func createAccountClicked(sender: AnyObject) {
        
    }
 
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        if NSUserDefaults.standardUserDefaults().boolForKey("fingerPrint") == true{
            return
        }
       
        if(NSUserDefaults.standardUserDefaults().boolForKey("accountActive") == true) {
        self.authenticateUser()
        }
        
    }
 
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         // Do any additional setup after loading the view, typically from a nib.
        
         emailTextField.attributedPlaceholder = NSAttributedString(string:"Enter Email",
            attributes:[NSForegroundColorAttributeName: UIColor(red:0.40, green:0.25, blue:0.45, alpha:1)])
        
        emailTextField.textColor = UIColor(red:0.40, green:0.25, blue:0.45, alpha:1)
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string:"Enter Password",
            attributes:[NSForegroundColorAttributeName: UIColor(red:0.40, green:0.25, blue:0.45, alpha:1)])
        
        passwordTextField.textColor = UIColor(red:0.40, green:0.25, blue:0.45, alpha:1)
        
        createAccount.tintColor = UIColor(red:0.40, green:0.25, blue:0.45, alpha:1)
        
        //
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
}

