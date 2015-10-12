//
//  DiceSelectScreenIC.swift
//  Dice Roller
//
//  Created by Hinck, Johann A on 10/11/15.
//  Copyright © 2015 Hinck, Johann A. All rights reserved.
//

import WatchKit
import Foundation


class DiceSelectScreenIC: WKInterfaceController
{
    
    let sides = [4,6,8,10,12,20,100]
    @IBOutlet var theTable: WKInterfaceTable!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let labelNames = ["D4", "D6", "D8", "D10", "D12", "D20", "D100"]
        self.theTable .setNumberOfRows(labelNames.count, withRowType: "cell")
        for(var i = 0; i < labelNames.count; i++)
        {
            let currRow = self.theTable.rowControllerAtIndex(i) as! diceRow
            currRow.d4Label.setText(labelNames[i])
            currRow.d4Image.setImageNamed(labelNames[i] + ".png")
            
        }

        
        // Configure interface objects here.
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int)
    {
        
        DiceRollerCore.numSides = self.sides[rowIndex]
        self.pushControllerWithName("QuantitySelectScreenIC", context: "")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
