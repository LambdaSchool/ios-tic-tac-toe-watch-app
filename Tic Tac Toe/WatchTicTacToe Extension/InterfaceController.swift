//
//  InterfaceController.swift
//  WatchTicTacToe Extension
//
//  Created by Carolyn Lea on 10/24/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet var label: WKInterfaceLabel!
    @IBOutlet var button0: WKInterfaceButton!
    @IBOutlet var button1: WKInterfaceButton!
    @IBOutlet var button2: WKInterfaceButton!
    @IBOutlet var button3: WKInterfaceButton!
    @IBOutlet var button4: WKInterfaceButton!
    @IBOutlet var button5: WKInterfaceButton!
    @IBOutlet var button6: WKInterfaceButton!
    @IBOutlet var button7: WKInterfaceButton!
    @IBOutlet var button8: WKInterfaceButton!
    
    
    private var game = Game()
    {
        didSet
        {

        }
    }
    
    override func awake(withContext context: Any?)
    {
        super.awake(withContext: context)
    }
    
    
    @IBAction func reset()
    {
    }
    
    @IBAction func button0Tapped()
    {
        print("button 0 tapped")
    }
    @IBAction func button1Tapped()
    {
        print("button 1 tapped")
    }
    @IBAction func button2Tapped()
    {
        print("button 2 tapped")
        
    }
    @IBAction func button3Tapped()
    {
        print("button 3 tapped")
        
    }
    @IBAction func button4Tapped()
    {
        print("button 4 tapped")
        
    }
    @IBAction func button5Tapped()
    {
        print("button 5 tapped")
        
    }
    @IBAction func button6Tapped()
    {
        print("button 6 tapped")
        
    }
    @IBAction func button7Tapped()
    {
        print("button 7 tapped")
        
    }
    @IBAction func button8Tapped()
    {
        print("button 8 tapped")
        
    }
    

}
