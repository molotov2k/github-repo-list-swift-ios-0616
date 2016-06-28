//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FISReposTableViewController: UITableViewController {
    
    let store = FISReposDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        store.getRepositoriesWithCompletion {
            NSOperationQueue.mainQueue().addOperationWithBlock({ 
                self.tableView.reloadData()
            })
        }
        
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.store.repositories.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("repoCell", forIndexPath: indexPath)

        let repository:FISGithubRepository = self.store.repositories[indexPath.row]
        cell.textLabel?.text = repository.fullName

        return cell
    }
 

}