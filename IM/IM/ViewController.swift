//
//  ViewController.swift
//  IM
//
//  Created by Jose on 3/26/16.
//  Copyright © 2016 JoseApps. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    let ref = Firebase(url: "https://myinstantmessenger.firebaseio.com")

    @IBOutlet var emailTextField: MaterialField!
    
    @IBOutlet var passwordField: MaterialField!
    
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

