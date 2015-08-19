//
//  PLMasterViewViewController.swift
//  prolificLib
//
//  Created by Phong Liew on 8/16/15.
//  Copyright (c) 2015 Phong Liew. All rights reserved.
//

import UIKit
import Alamofire
import Gloss

class PLMasterViewController: UITableViewController {

    var bookArrays = [];
    
    
    // Mark: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // navigationItem.title = "Books";
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAllBooks()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark: - Private Function
    
    private func getAllBooks(){
        PLAPIService.get( {responsePackage -> Void in
            if((responsePackage.error) === nil){
                self.bookArrays = responsePackage.response as! [AnyObject]
                self.tableView .reloadData()
                
            }
            else{
                print(responsePackage.error)
            }
        })
    }
    
    // MARK: - UITableViewDataSource

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bookArrays.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("LabelCell", forIndexPath: indexPath)
        
        let book = PLBook.fromJSON(self.bookArrays[indexPath.row] as! JSON)
        cell.textLabel?.text = book.title
        cell.detailTextLabel?.text = book.author
        
        return cell
    }

    // MARK: - UITableViewDelegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
        
        let book = PLBook.fromJSON(self.bookArrays[indexPath.row] as! JSON)

        self.performSegueWithIdentifier("showDetail", sender: book.url)
        
        print(row)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100;
    }

    
    // MARK: - UIStoryboardSegueSegue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if segue.identifier == "showDetail" {
            
            let nav = segue.destinationViewController as! UINavigationController
            let detailViewController = nav.topViewController as! PLDetailViewController

            let url = sender as! String
            detailViewController.urlStr = url

        }
    }
}
