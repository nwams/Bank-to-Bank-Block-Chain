//
//  AccountBalanceViewController.swift
//  BB Block Chain
//
//  Created by Nwamaka Nzeocha on 12/5/15.
//  Copyright © 2015 Nwamaka Nzeocha. All rights reserved.
//

import UIKit
import Parse

class AccountBalanceViewController: UIViewController {

    @IBOutlet weak var accountBalance: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        // display updated user account balance
        let currentUser = PFUser.currentUser()
        currentUser!.fetchInBackgroundWithBlock { (object, error) -> Void in
            currentUser!.fetchIfNeededInBackgroundWithBlock { (result, error) -> Void in
                // get rid of Optional print by using if let
                if let usrBalance = currentUser!.objectForKey("balance"){
                    let usrBal = usrBalance
                    self.accountBalance.text = "$" + String(usrBal)
                }
            }
        }
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
