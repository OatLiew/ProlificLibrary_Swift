//
//  PLMasterViewViewController.swift
//  prolificLib
//
//  Created by Phong Liew on 8/16/15.
//  Copyright (c) 2015 Phong Liew. All rights reserved.
//

import UIKit
import Alamofire

class PLMasterViewController: UITableViewController {

    var items: [String] = ["We", "Heart", "Swift"];

    // Mark: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        navigationItem.title = "Books";
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllBooks()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func getAllBooks(){
        
        PLAPIService.get() {responsePackage -> Void in
            if((responsePackage.error) === nil){
                print(responsePackage.response)
            }
            else{
                print(responsePackage.error)
            }
        }
    }
    

}

// MARK: - UITableViewDataSource

extension PLMasterViewController: UITableViewDataSource {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("LabelCell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row) \(items[indexPath.row])"
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension PLMasterViewController: UITableViewDelegate {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100;
    }
}


