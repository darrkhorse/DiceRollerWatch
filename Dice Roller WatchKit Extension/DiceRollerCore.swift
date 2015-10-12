//
//  DiceRollerCore.swift
//  Dice Roller
//
//  Created by Hinck, Johann A on 10/11/15.
//  Copyright © 2015 Hinck, Johann A. All rights reserved.
//

import WatchKit

class DiceRollerCore: NSObject
{
    
    static var numSides = 0
    static var numDice = 1
    static var theRolls = [Roll]()
    static var hasDice = false
    
    static func resetValues()
    {
        numDice = 1
        numSides = 0
        hasDice = false
    }
}
