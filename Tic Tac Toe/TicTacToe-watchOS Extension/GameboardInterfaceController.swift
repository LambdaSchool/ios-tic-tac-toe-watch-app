//
//  GameboardInterfaceController.swift
//  TicTacToe-watchOS Extension
//
//  Created by Daniela Parra on 12/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import WatchKit
import Foundation

class GameboardInterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        updateViews()
    }
    
    @IBAction func reset() {
        game.restart()
        button00.setTitle("")
        button01.setTitle("")
        button02.setTitle("")
        button10.setTitle("")
        button11.setTitle("")
        button12.setTitle("")
        button20.setTitle("")
        button21.setTitle("")
        button22.setTitle("")
    }
    
    @IBAction func pressButton00() {
        do {
            button00.setTitle(game.activePlayer?.stringValue)
            try game.makeMark(at: (0, 0))
        } catch {
            NSLog("Illegal move")
        }
    }
    
    @IBAction func pressButton01() {
        do {
            button01.setTitle(game.activePlayer?.stringValue)
            try game.makeMark(at: (0, 1))
        } catch {
            NSLog("Illegal move")
        }
    }
    
    @IBAction func pressButton02() {
        do {
            button02.setTitle(game.activePlayer?.stringValue)
            try game.makeMark(at: (0, 2))
        } catch {
            NSLog("Illegal move")
        }
    }
    
    @IBAction func pressButton10() {
        do {
            button10.setTitle(game.activePlayer?.stringValue)
            try game.makeMark(at: (1, 0))
        } catch {
            NSLog("Illegal move")
        }
    }
    
    @IBAction func pressButton11() {
        do {
            button11.setTitle(game.activePlayer?.stringValue)
            try game.makeMark(at: (1, 1))
        } catch {
            NSLog("Illegal move")
        }
    }
    
    @IBAction func pressButton12() {
        do {
            button12.setTitle(game.activePlayer?.stringValue)
            try game.makeMark(at: (1, 2))
        } catch {
            NSLog("Illegal move")
        }
    }
    
    @IBAction func pressButton20() {
        do {
            button20.setTitle(game.activePlayer?.stringValue)
            try game.makeMark(at: (2, 0))
        } catch {
            NSLog("Illegal move")
        }
    }
    
    @IBAction func pressButton21() {
        do {
            button21.setTitle(game.activePlayer?.stringValue)
            try game.makeMark(at: (2, 1))
        } catch {
            NSLog("Illegal move")
        }
    }
    
    @IBAction func pressButton22() {
        do {
            button22.setTitle(game.activePlayer?.stringValue)
            try game.makeMark(at: (2, 2))
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
    
    private var game = Game() {
        didSet {
            updateViews()
        }
    }

    @IBOutlet weak var statusLabel: WKInterfaceLabel!
    
    @IBOutlet weak var button00: WKInterfaceButton!
    @IBOutlet weak var button01: WKInterfaceButton!
    @IBOutlet weak var button02: WKInterfaceButton!
    @IBOutlet weak var button10: WKInterfaceButton!
    @IBOutlet weak var button11: WKInterfaceButton!
    @IBOutlet weak var button12: WKInterfaceButton!
    @IBOutlet weak var button20: WKInterfaceButton!
    @IBOutlet weak var button21: WKInterfaceButton!
    @IBOutlet weak var button22: WKInterfaceButton!
    
}
