//
//  myButton.swift
//  twoFactorAuthentication
//
//  Created by Jose on 4/16/16.
//  Copyright © 2016 jose. All rights reserved.
//

import Foundation
import UIKit

class myButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 5.0
        
        //To change the border color and border width, you can use:
        
        self.layer.borderColor = UIColor(red:0.40, green:0.25, blue:0.45, alpha:0.5).CGColor
        
        self.layer.backgroundColor = UIColor(red:0.40, green:0.25, blue:0.45, alpha:0.5).CGColor
        
        self.layer.borderWidth = 1.5
    
    }
    
  
    

    
    
}
