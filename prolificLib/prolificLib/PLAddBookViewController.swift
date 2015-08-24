//
//  PLAddBookViewController.swift
//  prolificLib
//
//  Created by Phong Liew on 8/18/15.
//  Copyright © 2015 Phong Liew. All rights reserved.
//

import UIKit
import Gloss

class PLAddBookViewController: UITableViewController {
    
    @IBOutlet weak var bookTitle: UITextField!
    @IBOutlet weak var author: UITextField!
    @IBOutlet weak var publisher: UITextField!
    @IBOutlet weak var categories: UITextField!
    
    // Mark: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorColor = UIColor .clearColor();
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Mark: - IBAction
    
    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    @IBAction func submit(sender: AnyObject) {
        
        if (self.bookTitle.text!.isEmpty || self.author.text!.isEmpty || self.publisher.text!.isEmpty || self.categories.text!.isEmpty){
            
            print("enter all TextFields")
        }
        else{
            
            let book = [
                "author" : self.author.text! as String,
                "categories" : self.categories.text! as String,
                "lastCheckedOut" : "",
                "lastCheckedOutBy" : "",
                "publisher" : self.publisher.text! as String,
                "title" : self.bookTitle.text! as String,
                "url": ""
            ]
            
            postBook(book)
        }
    }
    
    // Mark: - Private
    
    private func postBook( parameters : JSON ){
        
        PLAPIService.post( parameters, completion: {responsePackage -> Void in
            
            if((responsePackage.error) === nil){
                print("Post a book")
                self.clearText()
            }
            else{
                print(responsePackage.error)
            }
        })
    }
    
    private func clearText(){
        
        self.author.text = ""
        self.categories.text = ""
        self.publisher.text = ""
        self.bookTitle.text = ""
    
    }

}
