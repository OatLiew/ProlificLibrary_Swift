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
            
            let book = PLBook(
                author:self.author.text,
                categories: self.categories.text,
                lastCheckedOut: "",
                lastCheckedOutBy: "",
                publisher: self.publisher.text,
                title: self.bookTitle.text,
                url: "").toJSON()
            
            postBook(book!)
        }
    }
    
    // Mark: - Private
    
    private func postBook( parameters : JSON ){
        
        PLAPIService.post( parameters, completion: {responsePackage -> Void in
            
            if((responsePackage.error) === nil){
                
            }
            else{
                print(responsePackage.error)
            }
        })
    }

}