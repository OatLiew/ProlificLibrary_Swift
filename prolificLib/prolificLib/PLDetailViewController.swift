//
//  PLDetailViewController.swift
//  prolificLib
//
//  Created by Phong Liew on 8/16/15.
//  Copyright (c) 2015 Phong Liew. All rights reserved.
//

import UIKit
import Gloss

class PLDetailViewController: UIViewController {

    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var publisherLbl: UILabel!
    @IBOutlet weak var categoriesLbl: UILabel!
    @IBOutlet weak var lastCheckLbl: UILabel!
    @IBOutlet weak var checkOutByLbl: UILabel!
    
    var urlStr : String = ""
    
    // Mark: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getBook(urlStr)
        
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
    
    
    // Mark: - Private
    
    private func getBook( url : String ){
        
        PLAPIService.get( url, completion: {responsePackage -> Void in
            
            if((responsePackage.error) === nil){
                
                let book = PLBook.init(json : responsePackage.response as! JSON)
                self.titleLbl.text = book!.title
                self.authorLbl.text = book!.author
                self.publisherLbl.text = book!.publisher
                self.categoriesLbl.text = book!.categories
                self.lastCheckLbl.text = book!.lastCheckedOut
                self.checkOutByLbl.text = book!.lastCheckedOut
                
            }
            else{
                print(responsePackage.error)
            }
        })
    }

    
}

