//
//  GitHubAPIManager.swift
//  ExemploParseJSON
//
//  Created by Rodrigo A E Miyashiro on 11/9/15.
//  Copyright © 2015 Rodrigo A E Miyashiro. All rights reserved.
//

import Foundation

class GitHubAPIManager {
    
    var allUsers = NSArray()
    var allRepo = NSArray()
    
    //MARK: - REST calls
    // This makes the GET call to httpbin.org. It simply gets the IP address and displays it on the screen.
    func getFromGitHub (typeSearch: TypesSearch.typeSearch, search: String) {
        
        // Setup the session to make REST GET call.  Notice the URL is https NOT http!!
        let postEndpoint: String = "https://api.github.com/search/\(typeSearch)?q=\(search)"
        //"https://api.github.com/search/repositories?q=ios"
        //        print(postEndpoint)
        
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: postEndpoint)!
        
        // Make the POST call and handle it in a completion handler
        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
            do {
                if let ipString = NSString(data:data!, encoding: NSUTF8StringEncoding) {
                    // Print what we got from the call
                    print(ipString)
                    
                    // Parse the JSON to get the IP
                    let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    let origin = jsonDictionary["items"] as! NSArray
                    self.allUsers = origin
                    //                    print("\(origin)")
                    
                    //                    if typeSearch == TypesSearch.typeSearch.users {
                    //                        print("user")
                    //                        self.allUsers = origin
                    //                    }
                    //                    else {
                    //                        print("repository")
                    //                        self.allRepo = origin
                    //                    }
                    //                    dispatch_async(dispatch_get_main_queue()) {
                    //                        self.allUsers = origin
                    //                    }
                    
                    
                    // Update the label
                    //self.performSelectorOnMainThread("updateIPLabel:", withObject: origin, waitUntilDone: false)
                }
            } catch {
                print("bad things happened")
            }
        }).resume()
        
    }
    
    func getAllUsers () -> NSArray {
        return self.allUsers
    }
}