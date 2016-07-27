//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    
    var repositories = [GithubRepository]()
    
    func getRepositoriesWithCompletion(completion: () -> ()) {
        GithubAPIClient.getRepositoriesWithCompletion { (data) in
            self.repositories.removeAll()
            dispatch_async(dispatch_get_main_queue()) {
                for repository in data {
                    let repo = GithubRepository.init(repository: repository)
                    self.repositories.append(repo)
                }
                print("Download complete")
                let notificationCenter = NSNotificationCenter.defaultCenter()
                notificationCenter.postNotificationName("update", object: nil)
            }
        }
    }
    

}
