//
//  TransferDetails2ViewController.swift
//  BB Block Chain
//
//  Created by Nwamaka Nzeocha on 10/3/15.
//  Copyright © 2015 Nwamaka Nzeocha. All rights reserved.
//

import UIKit
import Parse

class TransferDetails2ViewController: UIViewController {
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var amountButton: UIButton!
    @IBOutlet weak var toButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var accountBalance: UILabel!
    
    let myAVC = AmountViewController.self
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelButton.layer.borderColor = UIColor(red:188/255.0, green:179/255.0, blue:165/255.0, alpha: 1.0).CGColor
        
        //red
        amountButton.layer.borderColor = UIColor(red:209/255.0, green:0/255.0, blue:38/255.0, alpha: 1.0).CGColor
        toButton.layer.borderColor = UIColor(red:209/255.0, green:0/255.0, blue:38/255.0, alpha: 1.0).CGColor
        
        continueButton.enabled = false
        continueButton.alpha = 0.5
        
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

    
    override func viewDidAppear(animated: Bool) {
        
        let wasDefaultSet = NSUserDefaults.standardUserDefaults().boolForKey("isDollarAmountSaved")
        
        //change Amount button color to grey after setting amount :)
        if(wasDefaultSet){
            amountButton.layer.borderColor = UIColor(red:171/255.0, green:171/255.0, blue:171/255.0, alpha: 1.0).CGColor
            amountButton.setTitleColor(UIColor(red:171/255.0, green:171/255.0, blue:171/255.0, alpha: 1.0), forState: .Normal)
        }
        
        let wasReceipientsDefaultSet = NSUserDefaults.standardUserDefaults().boolForKey("isReceipientsInfoSaved")
        
        //change To button color to grey after setting receipient details
        if(wasReceipientsDefaultSet){
            toButton.layer.borderColor = UIColor(red:171/255.0, green:171/255.0, blue:171/255.0, alpha: 1.0).CGColor
            toButton.setTitleColor(UIColor(red:171/255.0, green:171/255.0, blue:171/255.0, alpha: 1.0), forState: .Normal)
        }
        
        
        // if Amount and To are both set, activate Continue button
        if (wasDefaultSet && wasReceipientsDefaultSet){
            continueButton.enabled = true
            continueButton.alpha = 1
        }
        
    }

    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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