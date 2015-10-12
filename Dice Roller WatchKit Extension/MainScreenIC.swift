//
//  MainScreenIC.swift
//  Dice Roller
//
//  Created by Hinck, Johann A on 10/11/15.
//  Copyright © 2015 Hinck, Johann A. All rights reserved.
//

import WatchKit
import Foundation


class MainScreenIC: WKInterfaceController
{
    @IBOutlet var theTable: WKInterfaceTable!
    
    override func awakeWithContext(context: AnyObject?)
    {
        super.awakeWithContext(context)
        let defaults = NSUserDefaults.standardUserDefaults()
        var numOfRows = defaults.valueForKey("numOfRows")! as! Int
        self.theTable.setNumberOfRows(numOfRows, withRowType: "cell")
        for(var i = 0; i < numOfRows; i++)
        {
            var savedQty = defaults.valueForKey("\(i)qty")! as! Int
            var savedNumSides = defaults.valueForKey("\(i)numSides")! as! Int
            let currRow = self.theTable.rowControllerAtIndex(i) as! rollRow
            currRow.qtyLabel.setText("\(savedQty)")
            currRow.sidesLabel.setText("\(savedNumSides)")
            
    
        }
        
       
        
        
        
        
 
        
        // Configure interface objects here.
    }

    func generateTable()
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        var numOfRows = defaults.valueForKey("numOfRows")! as! Int
        defaults.setInteger(DiceRollerCore.theRolls.count + numOfRows, forKey: "numOfRows")
        
        self.theTable.setNumberOfRows(DiceRollerCore.theRolls.count + numOfRows, withRowType: "cell")
        for(var i = 0 + numOfRows; i < DiceRollerCore.theRolls.count + numOfRows; i++)
        {
            
            let currRow = self.theTable.rowControllerAtIndex(i) as! rollRow
            defaults.setInteger(DiceRollerCore.theRolls[i - numOfRows].qty, forKey: "\(i)qty")
            currRow.qtyLabel.setText("\(DiceRollerCore.theRolls[i - numOfRows].qty)")
            defaults.setInteger(DiceRollerCore.theRolls[i - numOfRows].numSides, forKey: "\(i)numSides")
            currRow.sidesLabel.setText("D\(DiceRollerCore.theRolls[i - numOfRows].numSides)")
        }
    
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        print("I'm about to activate")
        if(DiceRollerCore.hasDice)
        {
            //we need to add the new Roll to our array of Rolls
            DiceRollerCore.theRolls.append(Roll(qty: DiceRollerCore.numDice, numSides: DiceRollerCore.numSides))
            DiceRollerCore.resetValues()
            
            //we need to rebuild our table
            self.generateTable()
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
