//
//  PLDetailViewController.swift
//  prolificLib
//
//  Created by Phong Liew on 8/16/15.
//  Copyright (c) 2015 Phong Liew. All rights reserved.
//

import UIKit

class PLDetailViewController: UIViewController {

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
    
}
