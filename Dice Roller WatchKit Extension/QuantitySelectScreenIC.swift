//
//  QuantitySelectScreenIC.swift
//  Dice Roller
//
//  Created by Hinck, Johann A on 10/11/15.
//  Copyright © 2015 Hinck, Johann A. All rights reserved.
//

import WatchKit
import Foundation


class QuantitySelectScreenIC: WKInterfaceController
{
    @IBOutlet var thePicker: WKInterfacePicker!

    @IBAction func pickerDidChange(value: Int)
    {
        DiceRollerCore.numDice = value + 1
        
    }
    
    @IBAction func addRollButtonPressed()
    {
        DiceRollerCore.hasDice = true
        self.popToRootController()
    }
    
    override func awakeWithContext(context: AnyObject?)
    {
        super.awakeWithContext(context)
        
        var thePickerItems = [WKPickerItem]()
        for(var i = 1; i <= 100; i++)
        {
            thePickerItems.append(WKPickerItem())
            thePickerItems[i-1].title = "\(i)"
        }
        self.thePicker.setItems(thePickerItems)
        
        // Configure interface objects here.
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
