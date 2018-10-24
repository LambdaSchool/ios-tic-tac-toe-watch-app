//
//  InterfaceController.swift
//  WatchTicTacToe Extension
//
//  Created by Carolyn Lea on 10/24/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController
{
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
    
    lazy var buttons: [WKInterfaceButton] = [button0, button1, button2, button3, button4, button5, button6, button7, button8]
    
    private var game = Game()
    {
        didSet
        {
            updateViews()
        }
    }
    
    override func awake(withContext context: Any?)
    {
        super.awake(withContext: context)
        updateViews()
    }
    
    
    @IBAction func reset()
    {
        game.restart()
        buttons.forEach({ $0.setTitle("") })
    }
    
    private func updateViews()
    {
        if let winner = game.winningPlayer?.stringValue
        {
            label.setText("Player \(winner) won!")
        }
        else if let player = game.activePlayer?.stringValue
        {
            label.setText("Player \(player)'s turn")
        }
        else if game.isOver
        {
            label.setText("Cat's game!")
        }
    }
    
    
    private func placeMarkAt(_ coordinate: Coordinate, for button: WKInterfaceButton)
    {
        guard let mark = game.activePlayer?.stringValue,
            !game.board.hasMarkAt(square: coordinate) else { return }
        
        do
        {
            button.setTitle(mark)
            try game.makeMark(at: coordinate)
        }
        catch
        {
            NSLog("Illegal move made")
        }
    }
    
    @IBAction func button0Tapped()
    {
        print("button 0 tapped")
        placeMarkAt((0, 0), for: button0)
    }
    @IBAction func button1Tapped()
    {
        print("button 1 tapped")
        placeMarkAt((0, 1), for: button1)
    }
    @IBAction func button2Tapped()
    {
        print("button 2 tapped")
        placeMarkAt((0, 2), for: button2)
        
    }
    @IBAction func button3Tapped()
    {
        print("button 3 tapped")
        placeMarkAt((1, 0), for: button3)
        
    }
    @IBAction func button4Tapped()
    {
        print("button 4 tapped")
        placeMarkAt((1, 1), for: button4)
        
    }
    @IBAction func button5Tapped()
    {
        print("button 5 tapped")
        placeMarkAt((1, 2), for: button5)
        
    }
    @IBAction func button6Tapped()
    {
        print("button 6 tapped")
        placeMarkAt((2, 0), for: button6)
        
    }
    @IBAction func button7Tapped()
    {
        print("button 7 tapped")
        placeMarkAt((2, 1), for: button7)
        
    }
    @IBAction func button8Tapped()
    {
        print("button 8 tapped")
        placeMarkAt((2, 2), for: button8)
        
    }
    

}


//NOTES:
//Cannot use instance member 'button0' within property initializer; property initializers run before 'self' is available - (fixed by using "lazy")
