//
//  TaskManager.swift
//  twoFactorAuthentication
//
//  Created by Jose on 4/20/16.
//  Copyright © 2016 jose. All rights reserved.
//

import UIKit

var TaskMgr: TaskManager = TaskManager()

struct task {
    var websiteUrl = "Website"
    var websitePassword = "Password"
}

class TaskManager: NSObject {
    
    var tasks = [task]()
    
    func addTask(websiteUrl :String, websitePassword :String) -> Void
    {
        tasks.append(task(websiteUrl: websiteUrl, websitePassword: websitePassword))
       
        
    }
}