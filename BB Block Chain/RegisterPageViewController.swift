//
//  RegisterPageViewController.swift
//  BB Block Chain
//
//  Created by Nwamaka Nzeocha on 9/28/15.
//  Copyright © 2015 Nwamaka Nzeocha. All rights reserved.
//

import UIKit
import Parse

class RegisterPageViewController: UIViewController {
    
    @IBOutlet weak var userFirstNameTextField: UITextField!
    @IBOutlet weak var userLastNameTextField: UITextField!
    @IBOutlet weak var userAccountNumberTextField: UITextField!
    @IBOutlet weak var userUsernameTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //hide keyboard when not typing
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        
        let userFirstName = userFirstNameTextField.text
        let userLastName = userLastNameTextField.text
        let userAccountNumber = userAccountNumberTextField.text
        let userUsername = userUsernameTextField.text
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let userRepeatPassword = repeatPasswordTextField.text
        
        // Check for empty fields .(!) is unwrap operator to force out value
        if (userFirstName!.isEmpty || userLastName!.isEmpty || userAccountNumber!.isEmpty || userUsername!.isEmpty || userEmail!.isEmpty || userPassword!.isEmpty || userRepeatPassword!.isEmpty){
            
            // Display alert message
            displayMyAlertMessage("All fields are required")
            return
        }
        
        
        // Check if passwords match
        if (userPassword != userRepeatPassword){
            // Display an alert message
            displayMyAlertMessage("Passwords do not match")
            return
        }
        
        // Store data
        NSUserDefaults.standardUserDefaults().setObject(userFirstName, forKey: "userFirstName")
        NSUserDefaults.standardUserDefaults().setObject(userLastName, forKey: "userLastName")
        NSUserDefaults.standardUserDefaults().setObject(userAccountNumber, forKey: "userAccountNumber")
        NSUserDefaults.standardUserDefaults().setObject(userUsername, forKey: "userUsername")
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey: "userEmail")
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey: "userPassword")
        NSUserDefaults.standardUserDefaults().setObject("Bank of America", forKey: "userBankName")
        NSUserDefaults.standardUserDefaults().setObject("2813308004", forKey: "userMobilePhone")
        NSUserDefaults.standardUserDefaults().synchronize()
                
        // Display alert message with confirmation.
        let myAlert = UIAlertController(title:"Registration successful.", message:"Thank you!", preferredStyle: UIAlertControllerStyle.Alert)
        
        
        // Dismiss when OK button is pressed
        let okAction = UIAlertAction(title: "Ok", style:UIAlertActionStyle.Default){
            action in self.dismissViewControllerAnimated(true, completion: nil)
        }
        // go back to viewController screen
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    
    func displayMyAlertMessage(userMessage: String){
        let myAlert = UIAlertController(title:"WAIT, NO", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        
        presentViewController(myAlert, animated: true, completion: nil)
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
