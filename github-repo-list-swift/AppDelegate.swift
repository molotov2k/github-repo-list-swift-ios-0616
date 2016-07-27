//
//  AppDelegate.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import OHHTTPStubs

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        if isRunningTests() {
            OHHTTPStubs.stubRequestsPassingTest({ (request) -> Bool in
                
                return(request.URL?.host == "api.github.com" && request.URL?.path == "/repositories")
                
            }) { (request) -> OHHTTPStubsResponse in
                let response = OHHTTPStubsResponse(fileAtPath: OHPathForFileInBundle("repositories.json", NSBundle(forClass: self.dynamicType))!, statusCode: 200, headers: ["Content-Type": "application/json"])
                return response
            }
        }
        return true
    }
    
    
    
    func isRunningTests() -> Bool {
        let env = NSProcessInfo.processInfo().environment
        if let injectBundle = env["XCTestConfigurationFilePath"] {
            return NSString(string: injectBundle).pathExtension == "xctestconfiguration"
        }
        return false
    }


}

