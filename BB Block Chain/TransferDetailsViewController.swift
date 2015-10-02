//
//  TransferDetailsViewController.swift
//  BB Block Chain
//
//  Created by Nwamaka Nzeocha on 10/1/15.
//  Copyright © 2015 Nwamaka Nzeocha. All rights reserved.
//

import UIKit

class TransferDetailsViewController: UIViewController, UITableViewDataSource {
    
    //let transferDetailsLabels = ["From - Checking Acct 2334", "To", "Amount"]
    
    
    @IBOutlet weak var transferDetailsTableView: UITableView!
    
    @available(iOS 2.0, *)
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        // Default is 1 if not implemented
        return 3
    }
    
    
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        /*if (section == 0){
            return 2
        }
        if (section == 1){
            return 1
        }*/
        //return transferDetailsLabels.count
        return 1
    }
    
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let myCell:UITableViewCell = transferDetailsTableView.dequeueReusableCellWithIdentifier("prototype2", forIndexPath: indexPath)
        
        //myCell.textLabel?.text = transferDetailsLabels[indexPath.row]
        switch (indexPath.section) {
        case 0:
            myCell.textLabel?.text = "From - Checking Acct 2334"
            myCell.detailTextLabel?.text = "$2000"

        case 1:
            myCell.textLabel?.text = "To"
            myCell.detailTextLabel?.text = ""

        case 2:
            myCell.textLabel?.text = "Amount"
            myCell.detailTextLabel?.text = ""

        default:
            break
        }
        
        return myCell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Do any additional setup after loading the view.
        
        //basically says the dataSource prototype of transferDetailsTableVIew is implemented by the class UITableViewDataSource above
        transferDetailsTableView.dataSource = self
    }

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
