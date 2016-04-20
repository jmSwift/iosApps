//
//  MaterialField.swift
//  IM
//
//  Created by Jose on 3/31/16.
//  Copyright © 2016 JoseApps. All rights reserved.
//

import Foundation
import UIKit
//import <QuartzCore/QuartzCore.h>

class MaterialField: UITextField{
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        //self.delegate = self
        
        layer.cornerRadius = 2.0;
       layer.shadowColor = UIColor(red: RED, green: GREEN, blue: BLUE, alpha: 0.5).CGColor
        
        layer.shadowOpacity = 0.95
        layer.shadowRadius = 10.0
        layer.shadowOffset = CGSizeMake(0.0,15.0)
        layer.borderColor = UIColor(red: RED, green: GREEN, blue: BLUE, alpha: 0.5).CGColor
        
        //layer.borderWidth = 2.0
       self.textColor = UIColor(red: RED, green: GREEN, blue: BLUE, alpha: 0.5)
        //self.tintColor = UIColor.purpleColor()
       // selt.attribute
        
       

    }

    
}
