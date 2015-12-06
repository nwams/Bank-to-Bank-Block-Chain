//
//  ViewController.swift
//  BB Block Chain
//
//  Created by Nwamaka Nzeocha on 9/27/15.
//  Copyright © 2015 Nwamaka Nzeocha. All rights reserved.
//

import UIKit
import Parse


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // hide top navivation controller bar
        //self.navigationController!.navigationBar.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // when user tries to access Protected page, present login view
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        let isUserLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn")
        
        if(!isUserLoggedIn){
            self.performSegueWithIdentifier("loginView", sender: self)
        }
        
    }

    @IBAction func logoutButtonTapped(sender: AnyObject) {
        // Send a request to log out a user
        PFUser.logOut()
        
        NSUserDefaults.standardUserDefaults().setBool(false, forKey:"isUserLoggedIn")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        self.performSegueWithIdentifier("loginView", sender: self)
    }
    
    @IBAction func sendMoneyInSecondsButtonTapped(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey:
            "isDollarAmountSaved")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        //Recipients data NOT saved yet
        NSUserDefaults.standardUserDefaults().setBool(false, forKey:"isReceipientsInfoSaved")
    }
}



