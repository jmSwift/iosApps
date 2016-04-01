//
//  MaterialView.swift
//  IM
//
//  Created by Jose on 3/31/16.
//  Copyright © 2016 JoseApps. All rights reserved.
//

import UIKit

class MaterialView: UIView {

    //when user interface is called from the storyboard
    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0,2.0)
        
        
    }
}
