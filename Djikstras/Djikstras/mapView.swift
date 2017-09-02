//
//  mapView.swift
//  Djikstras
//
//  Created by Jose on 5/28/17.
//  Copyright © 2017 jose. All rights reserved.
//

import UIKit

class mapView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
 
    
    var currentShapeType: Int = 0
    
    init(frame: CGRect, shape: Int) {
        super.init(frame: frame)
        self.currentShapeType = shape
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 50.0 / 255.0, green: 50.0 / 255.0, blue: 50.0 / 255.0, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //You do NOT call this directly
    override func draw(_ rect: CGRect) {
        let h = rect.height
        let w = rect.width
        var color:UIColor = UIColor.yellow
        
        
        //FOR DRAWING INSIDE RECTANGLE
        //var drect = CGRect(x: (w * 0.25),y: (h * 0.25),width: (w * 0.5),height: (h * 0.5))
       // var bpath:UIBezierPath = UIBezierPath(rect: drect)
        
        color.set()
        //bpath.stroke()
        
      
        
    }
    
}
