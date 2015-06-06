//
//  intTracker.swift
//  TrackIt
//
//  Created by Michael Mendez on 5/21/15.
//  Copyright (c) 2015 Michael Mendez. All rights reserved.
//

import Foundation
import Parse

class intTracker {
    var total : Int = 0,
    description : String?
    
    init(description : String, total : Int){
        self.description = description
        self.total = total
    }
    
    init(description : String){
        self.description = description
    }
    
    func incTotal(){
        self.total += 1
    }
}