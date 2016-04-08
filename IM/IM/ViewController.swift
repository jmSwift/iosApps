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

class ViewController: UIViewController {
    
    //Firebase instantiation
    let REF = Firebase(url: "https://myinstantmessenger.firebaseio.com")
    // facebookLogin = FBSDKLoginManager()

    @IBOutlet var emailTextField: MaterialField!
    
    @IBOutlet var passwordField: MaterialField!
    
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



}

