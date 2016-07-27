//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    
    let fullName: String
    let htmlURL: NSURL
    let repositoryID: String
    
    required init(repository: [String:AnyObject]) {
        self.fullName = repository["name"] as! String
        self.htmlURL = NSURL(string: repository["html_url"] as! String)!
        self.repositoryID = String(repository["id"])
    }
    
    
}
