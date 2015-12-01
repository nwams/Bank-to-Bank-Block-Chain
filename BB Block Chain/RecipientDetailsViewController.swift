//
//  RecipientDetailsViewController.swift
//  BB Block Chain
//
//  Created by Nwamaka Nzeocha on 10/5/15.
//  Copyright © 2015 Nwamaka Nzeocha. All rights reserved.
//

import UIKit
import Parse

class RecipientDetailsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var recipientDetailsTableView: UITableView!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        recipientDetailsTableView.dataSource = self
        cancelButton.layer.borderColor = UIColor(red:188/255.0, green:179/255.0, blue:165/255.0, alpha: 1.0).CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @available(iOS 2.0, *)
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1
    }
    
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5
    }
    
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return "Manually enter recipient's details."
    }
    
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let myCell:UITableViewCell = recipientDetailsTableView.dequeueReusableCellWithIdentifier("recipientCells", forIndexPath: indexPath)
        
        //myCell.textLabel?.text = transferDetailsLabels[indexPath.row]
        switch (indexPath.row) {
        case 0:
            myCell.textLabel?.text = "First Name"
            
        case 1:
            myCell.textLabel?.text = "Last Name"
            
        case 2:
            myCell.textLabel?.text = "Bank Name"
            
        case 3:
            myCell.textLabel?.text = "Bank Account #"
            
        case 4:
            myCell.textLabel?.text = "Mobile #"

        default:
            break
        }
        
        return myCell
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
