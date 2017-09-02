//
//  customUITabBar.swift
//  Djikstras
//
//  Created by Jose on 5/28/17.
//  Copyright © 2017 jose. All rights reserved.
//

import UIKit

class customUITabBar: UITabBar {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.barTintColor = UIColor(red: 50.0 / 255.0, green: 50.0 / 255.0, blue: 50.0 / 255.0, alpha: 1)
        self.tintColor = UIColor(red:0.00, green:0.69, blue:1.00, alpha:1.0)
       
    }

}
