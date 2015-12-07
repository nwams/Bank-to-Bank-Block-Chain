//
//  ObjectsTableViewController.swift
//  BB Block Chain
//
//  Created by Nwamaka Nzeocha on 12/6/15.
//  Copyright © 2015 Nwamaka Nzeocha. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ObjectsTableViewController: PFQueryTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // called before anything is loaded in the PFQueryViewController
    // run this to get data
    override func queryForTable() -> PFQuery {
        let query = PFQuery(className: "Transactions")
        query.cachePolicy = .CacheElseNetwork
        query.orderByDescending("createdAt")
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! BaseTableViewCell
        
        if let object = object {
            let createdDate = object.createdAt
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "MMM d, YYYY"
            let dateString = dateFormatter.stringFromDate(createdDate!)
            if dateString.isEmpty {
                cell.dateLabel.text = "Undefined"
            } else {
                cell.dateLabel.text = dateString
            }
        }
        
        cell.receiverLabel.text = (object?.objectForKey("receiver_first_name") as? String)! + " " + ((object?.objectForKey("receiver_last_name"))! as! String) as? String
        
        if let amountSent = object?.objectForKey("amount"){
            let amount = amountSent
            cell.amountLabel.text = "$" + String(amount)
        }
        
        return cell
    }
    
    
    // set height for row at index
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        // the 'load more' cell
        if indexPath.row + 1 > self.objects?.count {
            return 44
        }
        
        let height = super.tableView(tableView, heightForRowAtIndexPath: indexPath)
        return height
    }
    
    
    // load next page when 'load more' button is clicked
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row + 1 > self.objects?.count {
            self.loadNextPage()
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
            //show details when cell clicked
//        else {
//            self.performSegueWithIdentifier("showDetail", sender: self)
//        }
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
