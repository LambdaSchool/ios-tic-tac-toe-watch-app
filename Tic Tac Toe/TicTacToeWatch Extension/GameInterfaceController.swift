//
//  GameInterfaceController.swift
//  TicTacToeWatch Extension
//
//  Created by Linh Bouniol on 10/24/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import WatchKit
import Foundation


class GameInterfaceController: WKInterfaceController {
    
    // MARK: - Properties
    
    var game = Game() {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Outlets/Actions
    
    @IBOutlet weak var statusLabel: WKInterfaceLabel!
    
    @IBOutlet weak var button0: WKInterfaceButton!
    @IBOutlet weak var button1: WKInterfaceButton!
    @IBOutlet weak var button2: WKInterfaceButton!
    @IBOutlet weak var button3: WKInterfaceButton!
    @IBOutlet weak var button4: WKInterfaceButton!
    @IBOutlet weak var button5: WKInterfaceButton!
    @IBOutlet weak var button6: WKInterfaceButton!
    @IBOutlet weak var button7: WKInterfaceButton!
    @IBOutlet weak var button8: WKInterfaceButton!
    
    /*
     (0, 0) (1, 0) (2, 0)
     (0, 1) (1, 1) (2, 1)
     (0, 2) (1, 2) (2, 2)
    */
    
    @IBAction func markButton0() {
        mark(at: (0, 0))
    }
    
    @IBAction func markButton1() {
        mark(at: (1, 0))
    }
    
    @IBAction func markButton2() {
        mark(at: (2, 0))
    }
    
    @IBAction func markButton3() {
        mark(at: (0, 1))
    }
    
    @IBAction func markButton4() {
        mark(at: (1, 1))
    }
    
    @IBAction func markButton5() {
        mark(at: (2, 1))
    }
    
    @IBAction func markButton6() {
        mark(at: (0, 2))
    }
    
    @IBAction func markButton7() {
        mark(at: (1, 2))
    }
    
    @IBAction func markButton8() {
        mark(at: (2, 2))
    }
    
    @IBAction func resetGame() {
        game.restart()
        
        updateViews()   // want to clear the board
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        updateViews()
    }

    // MARK: - Methods
    
    private func mark(at coordinate: Coordinate) {
        
        do {
            try game.makeMark(at: coordinate)
        } catch {
            NSLog("Illegal move")
        }
        
        updateViews()
    }
    
    private func updateViews() {
        if let winner = game.winningPlayer?.stringValue {
            statusLabel.setText("Player \(winner) won!")
        } else if let player = game.activePlayer?.stringValue {
            statusLabel.setText("Player \(player)'s turn")
        } else if game.isOver {
            statusLabel.setText("Cat's game!")
        }
        
        button0.setTitle(game.board[(0, 0)]?.stringValue ?? "")
        button1.setTitle(game.board[(1, 0)]?.stringValue ?? "")
        button2.setTitle(game.board[(2, 0)]?.stringValue ?? "")
        button3.setTitle(game.board[(0, 1)]?.stringValue ?? "")
        button4.setTitle(game.board[(1, 1)]?.stringValue ?? "")
        button5.setTitle(game.board[(2, 1)]?.stringValue ?? "")
        button6.setTitle(game.board[(0, 2)]?.stringValue ?? "")
        button7.setTitle(game.board[(1, 2)]?.stringValue ?? "")
        button8.setTitle(game.board[(2, 2)]?.stringValue ?? "")
        
        // If we set the button title in the @IBAction, we would need to do the same thing in resetGamer() so we can clear the board.
        // Best thing to do is set it in updateViews(), then call updateViews() when the button is marked and when the board is reset.
    }
}
