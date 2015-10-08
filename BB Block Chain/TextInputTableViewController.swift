//
//  TextInputTableViewController.swift
//  BB Block Chain
//
//  Created by Nwamaka Nzeocha on 10/6/15.
//  Copyright © 2015 Nwamaka Nzeocha. All rights reserved.
//

import UIKit

class TextInputTableViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var bankName: UITextField!
    @IBOutlet weak var accountNum: UITextField!
    @IBOutlet weak var mobileNum: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    
    let myCVC = ConfirmViewController()

    
    @IBAction func continueButtonPressed(sender: AnyObject) {
    
        let receiverFirstName = firstName.text
        let receiverLastName = lastName.text
        let receiverBankName = bankName.text
        let receiverAccountNumber = accountNum.text
        let receiverMobileNumber = mobileNum.text
        
        // Check for empty fields .(!) is unwrap operator to force out value
        if (receiverFirstName!.isEmpty || receiverLastName!.isEmpty || receiverBankName!.isEmpty || receiverAccountNumber!.isEmpty || receiverMobileNumber!.isEmpty){
            // Display alert message
            displayMyAlertMessage("Please try again!")
            return
        }
        
        // Store data
        NSUserDefaults.standardUserDefaults().setObject(receiverFirstName, forKey: "receiverFirstName")
        NSUserDefaults.standardUserDefaults().setObject(receiverLastName, forKey: "receiverLastName")
        NSUserDefaults.standardUserDefaults().setObject(receiverBankName, forKey: "receiverBankName")
        NSUserDefaults.standardUserDefaults().setObject(receiverAccountNumber, forKey: "receiverAccountNumber")
        NSUserDefaults.standardUserDefaults().setObject(receiverMobileNumber, forKey: "receiverMobileNumber")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func displayMyAlertMessage(userMessage: String){
        let myAlert = UIAlertController(title:"All fields required", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK.", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        presentViewController(myAlert, animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    @IBAction func continueButton(sender: AnyObject) {
        let myArray: [String?] = [firstName.text, lastName.text, bankName.text, accountNum.text, mobileNum.text]
        print("printin' in the consoooole")
        myCVC.title = "Confirm"
        
        //let navController = UINavigationController(rootViewController: myCVC);
        self.presentViewController(myCVC, animated: true, completion: nil);
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelButton.layer.borderColor = UIColor(red:188/255.0, green:179/255.0, blue:165/255.0, alpha: 1.0).CGColor
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
