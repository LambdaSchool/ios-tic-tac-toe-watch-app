//
//  InterfaceController.swift
//  TicTacToeWatch Extension
//
//  Created by De MicheliStefano on 24.10.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    // MARK: - Properties
    @IBOutlet weak var statusLabel: WKInterfaceLabel!
    private var game = Game() {
        didSet {
            updateViews()
        }
    }
    @IBOutlet weak var oneLabel: WKInterfaceButton!
    @IBOutlet weak var twoLabel: WKInterfaceButton!
    @IBOutlet weak var threeLabel: WKInterfaceButton!
    @IBOutlet weak var fourLabel: WKInterfaceButton!
    @IBOutlet weak var fiveLabel: WKInterfaceButton!
    @IBOutlet weak var sixLabel: WKInterfaceButton!
    @IBOutlet weak var sevenLabel: WKInterfaceButton!
    @IBOutlet weak var eightLabel: WKInterfaceButton!
    @IBOutlet weak var nineLabel: WKInterfaceButton!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        
    }
    
    @IBAction func reset() {
        game.restart()
        oneLabel.setTitle("")
        twoLabel.setTitle("")
        threeLabel.setTitle("")
        fourLabel.setTitle("")
        fiveLabel.setTitle("")
        sixLabel.setTitle("")
        sevenLabel.setTitle("")
        eightLabel.setTitle("")
        nineLabel.setTitle("")
    }
    
    
    @IBAction func one() {
        if let player = game.activePlayer?.stringValue ?? game.winningPlayer?.stringValue {
            oneLabel.setTitle(player)
        }
        makeMark(at: (0, 0))
    }
    
    @IBAction func two() {
        if let player = game.activePlayer?.stringValue ?? game.winningPlayer?.stringValue {
            twoLabel.setTitle(player)
        }
        makeMark(at: (0, 1))
    }
    
    @IBAction func three() {
        if let player = game.activePlayer?.stringValue ?? game.winningPlayer?.stringValue {
            threeLabel.setTitle(player)
        }
        makeMark(at: (0, 2))
    }
    
    @IBAction func four() {
        if let player = game.activePlayer?.stringValue ?? game.winningPlayer?.stringValue {
            fourLabel.setTitle(player)
        }
        makeMark(at: (1, 0))
    }
    
    @IBAction func five() {
        if let player = game.activePlayer?.stringValue ?? game.winningPlayer?.stringValue {
            fiveLabel.setTitle(player)
        }
        makeMark(at: (1, 1))
    }
    
    @IBAction func six() {
        if let player = game.activePlayer?.stringValue ?? game.winningPlayer?.stringValue {
            sixLabel.setTitle(player)
        }
        makeMark(at: (1, 2))
    }
    
    @IBAction func seven() {
        if let player = game.activePlayer?.stringValue ?? game.winningPlayer?.stringValue {
            sevenLabel.setTitle(player)
        }
        makeMark(at: (2, 0))
    }
    
    @IBAction func eight() {
        if let player = game.activePlayer?.stringValue ?? game.winningPlayer?.stringValue {
            eightLabel.setTitle(player)
        }
        makeMark(at: (2, 1))
    }
    
    @IBAction func nine() {
        if let player = game.activePlayer?.stringValue ?? game.winningPlayer?.stringValue {
            nineLabel.setTitle(player)
        }
        makeMark(at: (2, 2))
    }
    
    // MARK: - Private
    
    private func updateViews() {
        if let winner = game.winningPlayer?.stringValue {
            statusLabel.setText("Player \(winner) won!")
        } else if let player = game.activePlayer?.stringValue {
            statusLabel.setText("Player \(player)'s turn")
        } else if game.isOver {
            statusLabel.setText("Cat's game!")
        }
    }
    
    private func makeMark(at coordinate: Coordinate) {
        do {
            try game.makeMark(at: coordinate)
        } catch {
            NSLog("Illegal move")
        }
        updateViews()
    }
    
}
