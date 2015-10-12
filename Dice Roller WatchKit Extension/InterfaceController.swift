//
//  InterfaceController.swift
//  Dice Roller WatchKit Extension
//
//  Created by Hinck, Johann A on 9/29/15.
//  Copyright © 2015 Hinck, Johann A. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController
{
    let alert = WKAlertAction(title: "Ok", style: WKAlertActionStyle.Cancel, handler: { () -> Void in })

    @IBAction func D4()
    {
       self.presentAlertControllerWithTitle("The Roll", message: "\(rand()%4 + 1)", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
    }

    @IBAction func D6()
    {
        self.presentAlertControllerWithTitle("The Roll", message: "\(rand()%6 + 1)", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
    }
    
    @IBAction func D8()
    {
        self.presentAlertControllerWithTitle("The Roll", message: "\(rand()%8 + 1)", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
    }
    
    @IBAction func D10()
    {
        self.presentAlertControllerWithTitle("The Roll", message: "\(rand()%10 + 1)", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
    }
    
    @IBAction func D12()
    {
        self.presentAlertControllerWithTitle("The Roll", message: "\(rand()%12 + 1)", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
    }
    
    @IBAction func D20()
    {
        self.presentControllerWithName("tableScreen", context: "whatever")
        //self.presentAlertControllerWithTitle("The Roll", message: "\(rand()%20 + 1)", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
    }
    
   
    @IBAction func D100()
    {
       self.pushControllerWithName("tableScreen", context: "Create a new roll")
        
        //self.presentAlertControllerWithTitle("The Roll", message: "\(rand()%100 + 1)", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
    }
    
    @IBOutlet var CustomDTable: WKInterfaceGroup!
    
    
  
    override func awakeWithContext(context: AnyObject?)
    {
        super.awakeWithContext(context)
        print("RootController:******\(context)")
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        if(DiceRollerCore.numSides != -1)
        {
            //Do something with the values
            print("Num Sides: \(DiceRollerCore.numSides)")
            print("Num Dice: \(DiceRollerCore.numDice)")
        }
       
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
