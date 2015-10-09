//
//  ConfirmViewController.swift
//  BB Block Chain
//
//  Created by Nwamaka Nzeocha on 10/6/15.
//  Copyright © 2015 Nwamaka Nzeocha. All rights reserved.
//

import UIKit

class ConfirmViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var showInfoTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        showInfoTableView.dataSource = self
    }
    
    func displayMyAlertMessage(userMessage: String){
        let myAlert = UIAlertController(title:"PAYMENT SENT", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK, Peace out.", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        presentViewController(myAlert, animated: true, completion: nil)
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        // check if user first name, last name, and bank info match the stored info
        let receiverfirstName = NSUserDefaults.standardUserDefaults().stringForKey("receiverFirstName");
        let receiverLastName = NSUserDefaults.standardUserDefaults().stringForKey("receiverLastName");
        let receiverBankName = NSUserDefaults.standardUserDefaults().stringForKey("receiverBankName");
        let receiverAccountNumber = NSUserDefaults.standardUserDefaults().stringForKey("receiverAccountNumber");
        let receiverMobileNumber = NSUserDefaults.standardUserDefaults().stringForKey("receiverMobileNumber");
        
        let myCell:UITableViewCell = showInfoTableView.dequeueReusableCellWithIdentifier("nwammysCell", forIndexPath: indexPath)
        
        switch (indexPath.row) {
        case 0:
            myCell.textLabel?.text = "First Name"
            myCell.detailTextLabel?.text = receiverfirstName
        case 1:
            myCell.textLabel?.text = "Last Name"
            myCell.detailTextLabel?.text = receiverLastName
        case 2:
            myCell.textLabel?.text = "Bank Name"
            myCell.detailTextLabel?.text = receiverBankName
        case 3:
            myCell.textLabel?.text = "Account Name"
            myCell.detailTextLabel?.text = receiverAccountNumber
        case 4:
            myCell.textLabel?.text = "Mobile Number"
            myCell.detailTextLabel?.text = receiverMobileNumber
        default:
            break
        }
        return myCell
    }


    
    /*
    func getData(theArray: [String]) -> [String] {
    let nwammysArray = theArray
    return nwammysArray
    }
    */
    
    /*
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier")
        if(cell == nil){
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "reuseIdentifier")
        }

        cell?.textLabel?.text = "goat"
        return cell!
    }
    */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
