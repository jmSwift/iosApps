//
//  myTextField.swift
//  twoFactorAuthentication
//
//  Created by Jose on 4/14/16.
//  Copyright © 2016 jose. All rights reserved.
//

import UIKit

class myTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
    
        layer.cornerRadius = 5
        //Hex 674172        
        layer.borderColor = UIColor(red:0.40, green:0.25, blue:0.45, alpha:0.5).CGColor
        layer.borderWidth = 1.0

        
        
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    }

}
