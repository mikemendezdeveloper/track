//
//  trackerDetailViewController.swift
//  TrackIt
//
//  Created by Michael Mendez on 5/22/15.
//  Copyright (c) 2015 Michael Mendez. All rights reserved.
//

import UIKit
import Parse

class trackerDetailViewController: UIViewController {
    
    var currentTracker : intTracker?
    
    @IBOutlet weak var trackerTitle: UILabel!
    
    @IBOutlet weak var trackerTotal: UILabel!
    
    @IBAction func incrementTotal(sender: AnyObject) {
        currentTracker?.incTotal()
        trackerTotal.text = String(currentTracker!.total)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trackerTitle.text = currentTracker!.description
        trackerTotal.text = String(currentTracker!.total)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
