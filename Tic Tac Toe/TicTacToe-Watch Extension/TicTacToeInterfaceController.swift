//
//  InterfaceController.swift
//  TicTacToe-Watch Extension
//
//  Created by Conner on 10/24/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import WatchKit
import Foundation

class TicTacToeInterfaceController: WKInterfaceController {
    // MARK: - Properties
    private var game = Game() {
        didSet {
            updateViews()
        }
    }
    private var buttons: [WKInterfaceButton] = []
    /*
     0,0 1,0 2,0
     0,1 1,1 2,1
     0,2 1,2 2,2
     */
    // MARK: - IBOutlets
    @IBOutlet var statusLabel: WKInterfaceLabel!
    @IBOutlet var buttonZeroZero: WKInterfaceButton!
    @IBOutlet var buttonOneZero: WKInterfaceButton!
    @IBOutlet var buttonTwoZero: WKInterfaceButton!
    @IBOutlet var buttonZeroOne: WKInterfaceButton!
    @IBOutlet var buttonOneOne: WKInterfaceButton!
    @IBOutlet var buttonTwoOne: WKInterfaceButton!
    @IBOutlet var buttonZeroTwo: WKInterfaceButton!
    @IBOutlet var buttonOneTwo: WKInterfaceButton!
    @IBOutlet var buttonTwoTwo: WKInterfaceButton!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        buttons = [buttonZeroZero, buttonOneZero, buttonTwoZero,
                   buttonZeroOne, buttonOneOne, buttonTwoOne,
                   buttonZeroTwo, buttonOneTwo, buttonTwoTwo]
        updateViews()
    }
    
    // MARK: - IBActions
    @IBAction func resetButtonTapped() {
        game.restart()
        self.buttons.forEach { $0.setTitle("") }
    }
    @IBAction func buttonZeroZeroTapped() {
        mark(coordinate: (0, 0), button: buttonZeroZero)
    }
    @IBAction func buttonOneZeroTapped() {
        mark(coordinate: (1, 0), button: buttonOneZero)
    }
    @IBAction func buttonTwoZeroTapped() {
        mark(coordinate: (2, 0), button: buttonTwoZero)
    }
    @IBAction func buttonZeroOneTapped() {
        mark(coordinate: (0, 1), button: buttonZeroOne)
    }
    @IBAction func buttonOneOneTapped() {
        mark(coordinate: (1, 1), button: buttonOneOne)
    }
    @IBAction func buttonTwoOneTapped() {
        mark(coordinate: (2, 1), button: buttonTwoOne)
    }
    @IBAction func buttonZeroTwoTapped() {
        mark(coordinate: (0, 2), button: buttonZeroTwo)
    }
    @IBAction func buttonOneTwoTapped() {
        mark(coordinate: (1, 2), button: buttonOneTwo)
    }
    @IBAction func buttonTwoTwoTapped() {
        mark(coordinate: (2, 2), button: buttonTwoTwo)
    }
    
    // MARK: - Private Functions
    private func mark(coordinate: Coordinate, button: WKInterfaceButton) {
        guard game.winningPlayer?.stringValue == nil else { return }
        do {
            button.setTitle(game.activePlayer?.stringValue)
            updateViews()
            try game.makeMark(at: coordinate)
        } catch {
            NSLog("Illegal move")
        }
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
    
}
