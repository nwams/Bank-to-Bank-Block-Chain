//
//  TextInputTableViewController.swift
//  BB Block Chain
//
//  Created by Nwamaka Nzeocha on 10/6/15.
//  Copyright © 2015 Nwamaka Nzeocha. All rights reserved.
//

import UIKit
import Foundation

class TextInputTableViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var bankName: UITextField!
    @IBOutlet weak var accountNum: UITextField!
    @IBOutlet weak var mobileNum: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    
    let myCVC = ConfirmViewController()

    //hide keyboard when not typing
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
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
        
        let params: [String: AnyObject] = [
        "name": "Nwamaka", "lastname":"Nzeocha"
        ]
        
        
        
        
        
        
        
        
        var configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        var session = NSURLSession(configuration: configuration)
        
        let url = NSURL(string:"https://radiant-tundra-7611.herokuapp.com/TestApi")
        let request = NSMutableURLRequest(URL: url!)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.HTTPMethod = "POST"
        var err: NSError?
        request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(params, options: [])
        
        let task = session.dataTaskWithRequest(request) {
            data, response, error in
            
            if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    print("response was not 200: \(response)")
                    return
                }
            }
            if (error != nil) {
                print("error submitting request: \(error)")
                return
            }
            
            // handle the data of the successful response here
//            var result = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: nil) as? NSDictionary
//            println(result)
        }
        task.resume()
        
        
        
        
        
        
        
        
        
        //json 
//        let postEndpoint: String = "https://radiant-tundra-7611.herokuapp.com/nwammy"
//        let urlRequest = NSURLRequest(URL: NSURL(string: postEndpoint)!)
//        
//        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue(), completionHandler:{_ -> Void in})
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
