//
//  InterfaceController.swift
//  TicTacToeWatch Extension
//
//  Created by Moin Uddin on 12/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        buttons = [buttonOne, buttonTwo, buttonThree, buttonFour, buttonFive, buttonSix, buttonSeven, buttonEight, buttonNine]
    }
    
    private func updateViews() {
        if let winner = game.winningPlayer?.stringValue {
            statusLabel.setText("Player \(winner) won!")
        } else if let player = game.activePlayer?.stringValue {
            statusLabel.setText("Player \(player)'s turn")
        } else if game.isOver {
            statusLabel.setText("Cat's game!")
        }
    }
    
    private func placeMark(coordinates: Coordinate) {
        do{
            try game.makeMark(at: coordinates)
        } catch {
            NSLog("Illegal move")
        }
    }
    
    
    
    @IBAction func buttonOneTapped() {
        buttonOne.setTitle(game.activePlayer?.stringValue)
        placeMark(coordinates: (0,0))

    }
    
    @IBAction func buttonTwoTapped() {
        buttonTwo.setTitle(game.activePlayer?.stringValue)
        placeMark(coordinates: (0,1))
    }
    
    @IBAction func buttonThreeTapped() {
        buttonThree.setTitle(game.activePlayer?.stringValue)
        placeMark(coordinates: (0,2))
    }
    
    @IBAction func buttonFourTapped() {
        buttonFour.setTitle(game.activePlayer?.stringValue)
        placeMark(coordinates: (1,0))
    }
    
    @IBAction func buttonFiveTapped() {
        buttonFive.setTitle(game.activePlayer?.stringValue)
        placeMark(coordinates: (1,1))
    }
    
    @IBAction func buttonSixTapped() {
        buttonSix.setTitle(game.activePlayer?.stringValue)
        placeMark(coordinates: (1,2))
    }
    
    @IBAction func buttonSevenTapped() {
        buttonSeven.setTitle(game.activePlayer?.stringValue)
        placeMark(coordinates: (2,0))
    }
    
    @IBAction func buttonEightTapped() {
        buttonEight.setTitle(game.activePlayer?.stringValue)
        placeMark(coordinates: (2,1))
    }
    
    @IBAction func buttonNineTapped() {
        buttonNine.setTitle(game.activePlayer?.stringValue)
        placeMark(coordinates: (2,2))
    }
    
    private var game = Game(){
        didSet{
            updateViews()
        }
    }

    
    var buttons: [WKInterfaceButton]!
    
    @IBAction func restartGame() {
        game.restart()
        for button in buttons {
            button.setTitle("")
        }
    }
    
    @IBOutlet weak var statusLabel: WKInterfaceLabel!
    
    @IBOutlet weak var buttonOne: WKInterfaceButton!
    @IBOutlet weak var buttonTwo: WKInterfaceButton!
    @IBOutlet weak var buttonThree: WKInterfaceButton!
    @IBOutlet weak var buttonFour: WKInterfaceButton!
    @IBOutlet weak var buttonFive: WKInterfaceButton!
    @IBOutlet weak var buttonSix: WKInterfaceButton!
    @IBOutlet weak var buttonSeven: WKInterfaceButton!
    @IBOutlet weak var buttonEight: WKInterfaceButton!
    @IBOutlet weak var buttonNine: WKInterfaceButton!
}
