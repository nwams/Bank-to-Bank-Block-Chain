//
//  TransferDetailsViewController.swift
//  BB Block Chain
//
//  Created by Nwamaka Nzeocha on 10/1/15.
//  Copyright © 2015 Nwamaka Nzeocha. All rights reserved.
//

import UIKit

class TransferDetailsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var transferDetailsTableView: UITableView!
    @IBOutlet weak var cancelButton: UIButton!
    
    @available(iOS 2.0, *)
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 3
    }
    
    
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
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
            myCell.textLabel?.text = "Amount"
            myCell.detailTextLabel?.text = ""
            myCell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator

        case 2:
            myCell.textLabel?.text = "To"
            myCell.detailTextLabel?.text = ""
            myCell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator

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
        
        cancelButton.layer.borderColor = UIColor(red:188/255.0, green:179/255.0, blue:165/255.0, alpha: 1.0).CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        }
        
        // Pass the selected object to the new view controller.
    }


