//
//  NewTrackerViewController.swift
//  TrackIt
//
//  Created by Michael Mendez on 5/16/15.
//  Copyright (c) 2015 Michael Mendez. All rights reserved.
//

import UIKit
//import Parse

protocol NewTrackerViewControllerDelegate{
    func addNewTracker(controller:NewTrackerViewController, newTracker: intTracker)
}

class NewTrackerViewController: UIViewController {
    //add delegate member to be used later
    var delegate:NewTrackerViewControllerDelegate? = nil
    
    //Add trackers member so I can pass one in...?
    var trackers : [intTracker]?
    
    //create a new instance of tracker class
    //Use user input to set values
    
    @IBOutlet weak var trackerDescription: UITextField!
    
    @IBAction func next(sender: AnyObject) {
        var desc = trackerDescription.text
        
        var newTracker = intTracker(description: desc)
        println("About to add new tracker")
        if delegate != nil {
            delegate!.addNewTracker(self, newTracker: newTracker)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let test = trackers?[0]{
            //  trackers[0]
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("blah")
        var test = "test"
        // Get the new view controller using segue.destinationViewController.
        /*
        Apparently I can't do the following
        segue.destinationViewController.trackers = trackers
        */
        // Pass the selected object to the new view controller.
    }
    
    
}
