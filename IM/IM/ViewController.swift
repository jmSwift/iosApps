//
//  ViewController.swift
//  IM
//
//  Created by Jose on 3/26/16.
//  Copyright © 2016 JoseApps. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit // needed for FB

class ViewController: UIViewController, UITextFieldDelegate {
    
    //Firebase instantiation
    let REF = Firebase(url: "https://myinstantmessenger.firebaseio.com")
    // facebookLogin = FBSDKLoginManager()

    
    
    @IBOutlet weak var email: MaterialField!
    
    @IBOutlet weak var pass: MaterialField!
    
    @IBOutlet weak var signWithEmail: UIButton!
    

    @IBAction func signIn(sender: AnyObject) {
        let newEmail = email.text
        let newPass = pass.text
        
        if newEmail != "" && newPass != "" {
           
            self.REF.authUser(newEmail, password: newPass, withCompletionBlock: {
                error, authData in
                
                //if user does not exist
                if error != nil {
                    print(error)
                    
                    //if user does not exist do the following
                    if error.code == STATUS_ACCOUNT_NONEXIST {
                        self.REF.createUser(newEmail, password: newPass, withValueCompletionBlock: { error, result in
                            
                            
                            if error != nil {
                                self.showErrorAlert("Could not create acount", msg: "Problem creating account. try something else")
                                
                            } else {
                                NSUserDefaults.standardUserDefaults().setValue(result[KEY_UID],forKey: KEY_UID)
                                
                                self.REF.authUser(newEmail, password: newPass, withCompletionBlock: nil)
                                
                                self.performSegueWithIdentifier(LOGGED_IN, sender: nil)
                                
                            }
                            
                        })
                    } else if error.code == -6 {
                        self.showErrorAlert("Error", msg: "invalid username or passord")
                    }
                } else {
                    self.performSegueWithIdentifier(LOGGED_IN, sender: nil)
                }
            })
        } else {
            showErrorAlert("Error",msg: "You must enter an email and password")
        }
        
    }
    
    
    func showErrorAlert(title: String , msg: String)
    {
        let alert = UIAlertController(title: title, message: msg, preferredStyle:  .Alert)
        let action = UIAlertAction(title : "Ok", style: .Default, handler : nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func fbBtnPressed(sender: UIButton!)
    {
        let facecbookLogin = FBSDKLoginManager()
        
        facecbookLogin.logInWithReadPermissions(["email"],fromViewController:self, handler:{ (facebookResult: FBSDKLoginManagerLoginResult!, facebookError: NSError!) -> Void in
            
            if facebookError != nil {
                print("Facebook Login failed \(facebookError)")
                
            } else {
               let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                
                print("successfully logged in with facebook. \(accessToken)")
               
                
                self.REF.authWithOAuthProvider("facebook", token: accessToken, withCompletionBlock: { error, authData in
                    
                    if error != nil  {
                        print("login failed" + (String)(error))
                        
                    } else {
                        print("Logged in \(authData)")
                        NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: KEY_UID)
                        self.performSegueWithIdentifier("loggedIn", sender: nil)
                        
                        
                    }
                    
                })
                
            }
        
        })
        
    }
    
    
    
    //automatically to logged in section if recognized
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //if user is logged into FB automatically log them into the loggedIn segue (home)
        
        
        if NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) != nil {
         self.performSegueWithIdentifier(LOGGED_IN, sender: nil)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
    }

    func textFieldShouldEndEditing( emailTextField: MaterialField, passwordField: MaterialField) -> Bool
    {
        return true
    }


}

