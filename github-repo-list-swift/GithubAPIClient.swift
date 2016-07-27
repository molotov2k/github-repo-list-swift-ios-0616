//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
        
    class func getRepositoriesWithCompletion(completion: (data: [[String:AnyObject]]) -> Void) {
        
        let secrets = Secrets()
        let defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        var dataTask: NSURLSessionDataTask?
        let url = NSURL(string: "https://api.github.com/orgs/learn-co-students/repos?client_id=\(secrets.clientID)&client_secret=\(secrets.clientSecret)")
    
        dataTask = defaultSession.dataTaskWithURL(url!) {
            data, response, error in
            do {
                let results = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSArray
                
                var output = [[String:AnyObject]]()
                for result in results {
                    let resultAsNSDictionary = result as! NSDictionary
                    output.append(resultAsNSDictionary as! Dictionary)
                }
                
                completion(data: output)
                
            } catch {
                print("JSON error while loading data")
            }
        }
        dataTask?.resume()
    }
    
    
}



