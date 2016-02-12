//
//  DetailViewController.swift
//  ZooKeeper
//
//  Created by Wayne Bangert on 2/4/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        
    }


}

