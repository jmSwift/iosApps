//
//  blueTextField.swift
//  Djikstras
//
//  Created by Jose on 5/28/17.
//  Copyright © 2017 jose. All rights reserved.
//

import UIKit

class blueTextField: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let color = UIColor(red:0.00, green:0.69, blue:1.00, alpha:1.0)
        
        //let textWidth = 260
        //let textHeight = 30
        
        /*
        self.frame.size = CGSize(width: textWidth, height: textHeight)
        self.frame.origin = CGPoint(x: (((superview?.frame.width)! / 2) - (self.frame.width / 2)), y: self.frame.origin.y)
        
        let gradientColor1 = UIColor(red: 100.0 / 255.0, green: 100.0 / 255.0, blue: 100.0 / 255.0, alpha: 1).cgColor
        let gradientColor2 = UIColor(red: 50.0 / 255.0, green: 50.0 / 255.0, blue: 50.0 / 255.0, alpha: 1).cgColor
        
        let btnGradient = CAGradientLayer()
        btnGradient.frame = self.bounds
        btnGradient.colors = [gradientColor1, gradientColor2]
        self.layer.insertSublayer(btnGradient, at: 0)
        */
 
        self.backgroundColor = UIColor(red: 75.0 / 255.0, green: 75.0 / 255.0, blue: 75.0 / 255.0, alpha: 1)
        
        self.layer.cornerRadius = 8.0
        self.clipsToBounds = true
        self.layer.borderWidth = 1.0
        self.layer.borderColor = color.cgColor
        
    }

}
