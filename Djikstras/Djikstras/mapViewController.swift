//
//  mapViewController.swift
//  Djikstras
//
//  Created by Jose on 5/28/17.
//  Copyright © 2017 jose. All rights reserved.
//

import UIKit

class mapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height / 2.0
        
        //if u want 75% of screen width
        //let screenWidth = screenSize.width * 0.75
        
        

        // Do any additional setup after loading the view.
        let k = mapView(frame: CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: screenWidth, height: screenHeight)))
        
        // Add the view to the view hierarchy so that it shows up on screen
        self.view.addSubview(k)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
