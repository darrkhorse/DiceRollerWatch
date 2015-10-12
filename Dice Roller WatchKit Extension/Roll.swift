//
//  Roll.swift
//  Dice Roller
//
//  Created by Hinck, Johann A on 10/11/15.
//  Copyright © 2015 Hinck, Johann A. All rights reserved.
//

import WatchKit

class Roll: NSObject
{
    var numSides: Int
    var qty: Int
    
    init(qty: Int, numSides: Int)
    {
        self.qty = qty
        self.numSides = numSides
    }
}
