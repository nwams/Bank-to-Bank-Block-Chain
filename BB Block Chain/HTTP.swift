//
//  HTTP.swift
//  BB Block Chain
//
//  Created by Nwamaka Nzeocha on 12/10/15.
//  Copyright © 2015 Nwamaka Nzeocha. All rights reserved.
//

import UIKit
import Foundation

class HTTP: NSObject {
    
    func POST (url: String, postComplete: (success: Bool, msg: String) -> ()) {
        // Set up the request object
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        // Initialize session object
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> () in
            
            if data == nil {
                postComplete(success: false, msg: "ERROR")
                print("Error data is nil")
                return
            }
            
        
        })
        task.resume()
    }
    
    func toJSON (dict: NSDictionary) -> NSData? {
        if NSJSONSerialization.isValidJSONObject(dict) {
            do {
                let json = try NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions())
                return json
            } catch let error as NSError {
                print("ERROR: Unable to serialize json, error: \(error)")
            }
        }
        return nil
    }
    
    func fromJSON (JSON: NSData) -> NSDictionary? {
        do {
            return try NSJSONSerialization.JSONObjectWithData(JSON, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
        } catch {
            return nil
        }
    }
}
