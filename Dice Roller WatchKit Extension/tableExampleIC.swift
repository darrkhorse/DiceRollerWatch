//
//  tableExampleIC.swift
//  Dice Roller
//
//  Created by Hinck, Johann A on 9/30/15.
//  Copyright © 2015 Hinck, Johann A. All rights reserved.
//

import WatchKit
import Foundation


class tableExampleIC: WKInterfaceController
{
    
    let alert = WKAlertAction(title: "Ok", style: WKAlertActionStyle.Cancel, handler: { () -> Void in })
    let sides = [4,6,8,10,12,20,100]

    @IBOutlet var theTable: WKInterfaceTable!
    override func awakeWithContext(context: AnyObject?)
    {
        
        super.awakeWithContext(context)
        print(context)
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
        //self.presentAlertControllerWithTitle("The Roll", message: "\(rand()%Int32(self.sides[rowIndex]) + 1)", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
        DiceRollerCore.numSides = self.sides[rowIndex]
        self.pushControllerWithName("pickerScreen", context: "D\(self.sides[rowIndex])")
        
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
