//
//  pickerExampleIC.swift
//  Dice Roller
//
//  Created by Hinck, Johann A on 10/1/15.
//  Copyright © 2015 Hinck, Johann A. All rights reserved.
//

import WatchKit
import Foundation


class pickerExampleIC: WKInterfaceController
{
    let alert = WKAlertAction(title: "Ok", style: WKAlertActionStyle.Cancel, handler: { () -> Void in })
    let sides = [4,6,8,10,12,20,100]

    @IBOutlet var thePicker: WKInterfacePicker!
    var currSelectedIndex = 0
    override func awakeWithContext(context: AnyObject?)
    {
        super.awakeWithContext(context)
        print("********** \(context)")
        
        var thePickerItems = [WKPickerItem]()
        let labelNames = ["D4", "D6", "D8", "D10", "D12", "D20", "D100"]
        for(var i = 0; i < labelNames.count; i++)
        {
        thePickerItems.append(WKPickerItem())
        thePickerItems[i].title = labelNames[i]
        thePickerItems[i].contentImage = WKImage(imageName: labelNames[i] + ".png")
            thePickerItems[i].caption = labelNames[i]
        }
        self.thePicker.setItems(thePickerItems)
        
        
        // Configure interface objects here.
    }

    @IBAction func whichOneButtonPressed()
    {
        //self.presentAlertControllerWithTitle("You Rolled", message: "\(rand()%Int32(self.sides[currSelectedIndex]) + 1)", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
        DiceRollerCore.numDice = self.currSelectedIndex
        self.popToRootController()
    }
    
    @IBAction func pickerWasClicked(value: Int)
    {
        self.currSelectedIndex = value
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
