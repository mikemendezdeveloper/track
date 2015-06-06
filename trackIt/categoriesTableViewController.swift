//
//  categoriesTableViewController.swift
//  TrackIt
//
//  Created by Michael Mendez on 5/8/15.
//  Copyright (c) 2015 Michael Mendez. All rights reserved.
//

import UIKit
import Parse

class categoriesTableViewController: UITableViewController, NewTrackerViewControllerDelegate {
    
    let startTracking = ["New +"]
    
    //TO DO: Move this array instantiation to the
    // initial wizard screen once that flow if built.
    var trackers = [intTracker]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Static Test Data
        var pagesRead = intTracker(
            description: "Pages Read",
            total: 5
        )
        var poundsLost = intTracker(
            description: "Pounds Lost",
            total: 2
        )
        var candiesEaten = intTracker(
            description: "Candies Eaten",
            total: 8
        )
        var testNoInitialTotal = intTracker(
            description: "Test no total value provided"
        )
        
        trackers.append(pagesRead)
        trackers.append(poundsLost)
        trackers.append(candiesEaten)
        trackers.append(testNoInitialTotal)
        
        //See if parse is working
        
        for index in 0..<trackers.count {
            let tracker = PFObject(className: "intTracker")
            tracker["total"] = trackers[index].total
            tracker["description"] = trackers[index].description
            tracker.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                println("Object has been saved.")
            }
        }
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if section == 0 {
            return 1
        }
        else{
            return trackers.count
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("catCell", forIndexPath: indexPath) as! UITableViewCell
        
        // Configure the cell...
        if indexPath.section == 0 {
            var currentCell = startTracking[indexPath.row]
            cell.textLabel?.text = currentCell
        }
        else{
            var currentCell = trackers[indexPath.row].description
            cell.textLabel?.text = currentCell
        }
        
        return cell
    }
    
    /* I found this and added it so I could do something as soon
    ** as a user clicks a cell
    */
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        var segId : String = indexPath.section == 0
            ? "newTracker"
            : "trackDetail"
        performSegueWithIdentifier(segId, sender: self)
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    //Delegate function which handles adding new trackers
    //From the NewTrackerViewController
    func addNewTracker(controller: NewTrackerViewController, newTracker: intTracker) {
        //trackers.append(newTracker)
        controller.navigationController?.popViewControllerAnimated(true)
        trackers.insert(newTracker, atIndex:0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 1)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        
        // Pass the selected object to the new view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow(){
            
            /* Pass the whole tracker array if creating a new one
            I don't know if I need to do this or if I could just
            add a new one without passing the array to the other VC
            */
            if indexPath.section == 0 {
                var destinationVC = segue.destinationViewController as! NewTrackerViewController
                destinationVC.trackers = trackers
                destinationVC.delegate = self
            }
            
            //Only pass the current tracker if not creating a new one
            if indexPath.section == 1 {
                var destinationVC = segue.destinationViewController as! trackerDetailViewController
                let currentTracker = trackers[indexPath.row]
                destinationVC.currentTracker = currentTracker
            }
        }
    }
    
    
}
