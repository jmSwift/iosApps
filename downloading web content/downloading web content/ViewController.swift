//
//  ViewController.swift
//  downloading web content
//
//  Created by Jose on 3/24/16.
//  Copyright © 2016 JoseApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string:"http://www.stackoverflow.com")!
        
        webView.loadRequest(NSURLRequest(URL:url))
        
        /*
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url){ (data, response, error) -> Void in
    
            //if data is returned
            if let urlContent = data {
                
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                self.webView.loadHTMLString(String (webContent), baseURL:nil)
                    
                })
            
            }
        }
        task.resume()

        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

