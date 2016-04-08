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
    
    let ref = Firebase(url: "https://myinstantmessenger.firebaseio.com")
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
                
                
            }
        
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ref.setValue("heyeee")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

