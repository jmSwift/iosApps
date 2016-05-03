//
//  tableViewController.swift
//  twoFactorAuthentication
//
//  Created by Jose on 5/2/16.
//  Copyright © 2016 jose. All rights reserved.
//

import UIKit


class tableViewController: UITableViewController{

    var array:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
    }    
    
    override func viewDidAppear(animated: Bool) {
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("Array") != nil ) {
        array1 = NSUserDefaults.standardUserDefaults().objectForKey("Array") as! NSArray as! [String]
        
        print(array1)
        print(array1.count)
            
        }
        
        print(array1)
        print(array1.count)
        
    }
    
    
    
    @IBOutlet var tblTasks: UITableView!
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = array1[indexPath.row]
        cell.detailTextLabel?.text = array1[indexPath.row]
        print("hello" + array[indexPath.row])
        /*
        cell.textLabel?.text = TaskMgr.tasks[indexPath.row].websiteUrl
        cell.detailTextLabel?.text = TaskMgr.tasks[indexPath.row].websitePassword
        */
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            
            TaskMgr.tasks.removeAtIndex(indexPath.row)
            tblTasks.reloadData()
        }
    }
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
}
