//
//  AmountViewController.swift
//  BB Block Chain
//
//  Created by Nwamaka Nzeocha on 10/3/15.
//  Copyright © 2015 Nwamaka Nzeocha. All rights reserved.
//

import UIKit

class AmountViewController: UIViewController {

    @IBOutlet weak var amountTextField: UITextField!
    
    var flag: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        amountTextField.becomeFirstResponder()
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        //dismiss the current view
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        let dollarAmount = amountTextField.text

        // Check for empty fields. (!) is unwrap operator to force out value
        if (dollarAmount!.isEmpty){
            // Display alert message
            displayMyAlertMessage("Must enter a dollar amount")
            return
        }
        
        // Store data
        NSUserDefaults.standardUserDefaults().setObject(dollarAmount, forKey: "dollarAmount")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        let dollarAmountStored = NSUserDefaults.standardUserDefaults().stringForKey("dollarAmount")
        // store info that dollar amount was successfully stored
        if(dollarAmountStored == dollarAmount){
            NSUserDefaults.standardUserDefaults().setBool(true, forKey:"isDollarAmountSaved")
            NSUserDefaults.standardUserDefaults().synchronize()

            //dismiss the current view
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    
    func displayMyAlertMessage(userMessage: String){
        let myAlert = UIAlertController(title:"WAIT A MINUTE!", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        
        presentViewController(myAlert, animated: true, completion: nil)
    }
    
    func passTheFlag() -> Int{
        let returnFlag = flag
        return returnFlag
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
