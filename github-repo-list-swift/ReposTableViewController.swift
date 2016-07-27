//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    
    let store = ReposDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.accessibilityLabel = "tableView"
        self.store.getRepositoriesWithCompletion() {}
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: #selector(reloadData), name: "update", object: nil)
    }
    
    func reloadData() {
        print("Reloading data, please sit tight!")
        self.tableView.reloadData()
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.repositories.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("repoCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = store.repositories[indexPath.row].fullName
        cell.detailTextLabel?.text = String(store.repositories[indexPath.row].htmlURL)
        
        return cell
    }

    @IBAction func addButtonTapped(sender: AnyObject) {
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.postNotificationName("update", object: self)
    }

}
