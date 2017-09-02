//
//  tableViewController.swift
//  twoFactorAuthentication
//
//  Created by Jose on 5/2/16.
//  Copyright © 2016 jose. All rights reserved.
//

import UIKit


class tableViewController: UITableViewController {

    var array:[String] = [String]()
    
    
    
    @IBOutlet var tbl2Tasks: UITableView!
    
    override func viewDidAppear(animated: Bool) {
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("Array") != nil ) {
        array1 = NSUserDefaults.standardUserDefaults().objectForKey("Array") as! NSArray as! [String]
        print(array1)

        }
        //tbl2Tasks.backgroundColor = UIColor.blackColor()
        tbl2Tasks.separatorColor = UIColor.blackColor()
        tbl2Tasks.backgroundColor = UIColor(red:0.40, green:0.25, blue:0.45, alpha:0.5)
        //tbl2Tasks.tableFooterView = UIView(frame: CGRectZero)
        
        tbl2Tasks.dataSource = self
        tbl2Tasks.delegate = self
        tbl2Tasks.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        tbl2Tasks.reloadData()
    }
    
  
    
    
   
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array1.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell",forIndexPath: indexPath)
        cell.textLabel?.text = array1[indexPath.row]
        //cell.detailTextLabel?.text = array1[indexPath.row]
        //cell.backgroundColor = UIColor.clearColor()//
        
        //@@@)
        cell.tintColor = UIColor.whiteColor()
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.backgroundColor = UIColor.clearColor()
        
        //print(cell.detailTextLabel?.text)
        
        /*
         cell.textLabel?.text = TaskMgr.tasks[indexPath.row].websiteUrl
         cell.detailTextLabel?.text = TaskMgr.tasks[indexPath.row].websitePassword
         */
        return cell        /*
        //let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell",forIndexPath: indexPath)
        cell.textLabel?.text! = array1[indexPath.row]
        cell.detailTextLabel?.text = array1[indexPath.row]
        
        //cell.tintColor = UIColor.whiteColor()
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.backgroundColor = UIColor.clearColor()
        
        let blackColor = UIView()
        blackColor.backgroundColor = UIColor.blackColor()
        cell.selectedBackgroundView =  blackColor
        
        /*
        cell.textLabel?.text = TaskMgr.tasks[indexPath.row].websiteUrl
        cell.detailTextLabel?.text = TaskMgr.tasks[indexPath.row].websitePassword
        */
        return cell
 
 */
        
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            
            array1.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(array1, forKey: "Array")
            NSUserDefaults.standardUserDefaults().synchronize()
            tbl2Tasks.reloadData()
        }
    }
    
    //customize delete button

    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .Destructive, title: "Delete") { (action: UITableViewRowAction, indexPath: NSIndexPath) -> Void in
            array1.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(array1, forKey: "Array")
            NSUserDefaults.standardUserDefaults().synchronize()
            self.tbl2Tasks.reloadData()
        }
        delete.backgroundColor = UIColor.blackColor()
        return [ delete]
    }
    
   
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "fingerPrint")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        
         
    
    }

}
