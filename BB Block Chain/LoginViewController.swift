//
//  LoginViewController.swift
//  BB Block Chain
//
//  Created by Nwamaka Nzeocha on 9/28/15.
//  Copyright © 2015 Nwamaka Nzeocha. All rights reserved.
//

import UIKit
import Parse


class LoginViewController: UIViewController {
    
    @IBOutlet weak var userUsernameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSUserDefaults.standardUserDefaults().setObject("8325418199", forKey: "userMobilePhone")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //hide keyboard when not typing
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    func check(number: Int) -> String {
        return "\(number)"
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        let userUsername = userUsernameTextField.text
        let userPassword = userPasswordTextField.text
        
        // Run a spinner to show a task in progress
        let spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
        spinner.startAnimating()
        
        // Send a request to login
        PFUser.logInWithUsernameInBackground(userUsername!, password: userPassword!, block: { (user, error) -> Void in
            
            // Stop the spinner
            spinner.stopAnimating()
            
            if ((user) != nil) {
                NSUserDefaults.standardUserDefaults().setObject(userUsername, forKey: "userUsername")
                // store info that user is successfully logged in
                NSUserDefaults.standardUserDefaults().setBool(true, forKey:"isUserLoggedIn");
                NSUserDefaults.standardUserDefaults().synchronize()
                //dismiss the login view
                self.dismissViewControllerAnimated(true, completion: nil)
                
            } else {
                let alert = UIAlertView(title: "Error", message: "Invalid username & password", delegate: self, cancelButtonTitle: "OK")
                alert.show()
            }
        })
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
