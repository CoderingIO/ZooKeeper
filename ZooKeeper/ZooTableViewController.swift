//
//  MasterViewController.swift
//  ZooKeeper
//
//  Created by Wayne Bangert on 2/4/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import UIKit
import SwiftyJSON

class ZooTableViewController: UITableViewController {

    //MARK: Properties
    //What does this do?
    var detailViewController: DetailViewController? = nil
    // Makes a dictionary of "AnyObject"s initialized to empty
    var zoo:Zoo!
    // Keys for the dictionary
    let animalSection = 0
    let staffSection = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.zoo = ZooData.sharedInstance.zoo

        // create a constant addButton using a convienece instance of UIBarButtonItem .Add is a systemItem, target is itself and calls the func in ""
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        //as UIBarButtonItem you can ge added to the navigationItem properties
        self.navigationItem.rightBarButtonItem = addButton
        //if constant split has a valid splitViewController
        if let split = self.splitViewController {
            //then create controllers the two "split" screens
            let controllers = split.viewControllers
            //assign to the "Detail View(left)"
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
            //Do I need one to display the directory?
        }
        //Set the table's row height to cgFloat of 85
        tableView.rowHeight = 85
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "dataUpdated:", name: ZooDataNotifications.Updated.rawValue, object: nil)
    
    
        
    }
    
    // MARK: - Notifications
    
    func dataUpdated(notification:NSNotification) {
        tableView.reloadData()
    }
    
    // standard function of mobile apps called after the views are visible
    override func viewWillAppear(animated: Bool) {
        //if the split view is collasped do not display "this" controller
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        // func that when call will make the view animate
        super.viewWillAppear(animated)
        //Reload the data in the data view
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Not sure what to do with this
    func insertNewObject(sender: AnyObject) {
        
        //Animal.toDictionary().insert(Zoo.animals, atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }

    // MARK: - Segues
    // prepare for go to a new storboard scene
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // creates a var to hold the detail item
        var detailItem:AnyObject?
        // have the controller segue to the detail view controller as the top controller
        let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
        // if index path has a valid value
        if let indexPath = self.tableView.indexPathForSelectedRow {
            
            // and if the identifier is an animal detail
            if segue.identifier == "AnimalDetail" {
                //then the detail item is the animal info in that row
                detailItem = zoo.animals[indexPath.row]
            // or if the identifier is a staff detail
            } else if segue.identifier == "StaffDetail" {
                // then the detailItem is the staff info at selected row
                detailItem = zoo.staff[indexPath.row]
                //Dont know this yet
                //(controller as! StaffViewController).delegate = self
            }
        }
        //more stuff I dont know
        controller.detailItem = detailItem
        controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
        controller.navigationItem.leftItemsSupplementBackButton = true
    }

    // MARK: - Table View
    // used to make number of sections in the table view assign as int
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // use data array count to determin sections. in this case 2
        return 2
    }
    // func to set up number of rows in section
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // if the data dictionary has sections
        switch section {
        case animalSection:
            return zoo.animals.count
        case staffSection:
            return zoo.staff.count
        default:
            return 0
        }
        
    }
    // func of table view to set up cells for each row at the index path returns a UITableViewCell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // if indexpath is section 0 "the animal section"
        if indexPath.section == 0 {
            // create a cell
            let cell = tableView.dequeueReusableCellWithIdentifier("AnimalCell", forIndexPath: indexPath) as! AnimalTableViewCell

            let animal = zoo.animals[indexPath.row]
            cell.animal = animal
            cell.configureView()
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("StaffCell", forIndexPath: indexPath) as! StaffTableViewCell
            let staff = zoo.staff[indexPath.row]
            cell.staff = staff
            cell.configureView()
            return cell
            
        }
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            if indexPath.section == 0 {
                zoo.animals.removeAtIndex(indexPath.row)
            } else if indexPath.section == 1 {
                zoo.staff.removeAtIndex(indexPath.row)
                
            }
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

