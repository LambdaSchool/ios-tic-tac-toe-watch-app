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
        setUpButtons()
        updateViews()
    }
    
    @IBAction func reset() {
        game.restart()
    }
    
    @IBAction func mark(_ sender: GameboardButton) {
        do {
            try game.makeMark(at: sender.coordinates!)
        } catch {
            NSLog("Illegal move")
        }
    }
    
    // MARK: - Private
    
    private func setUpButtons() {
        button00.coordinates = (0,0)
        button01.coordinates = (0,1)
        button02.coordinates = (0,2)
        button10.coordinates = (1,0)
        button11.coordinates = (1,1)
        button12.coordinates = (1,2)
        button20.coordinates = (2,0)
        button21.coordinates = (2,1)
        button22.coordinates = (2,2)
        
        buttons = [button00, button01, button02, button10, button11, button12, button20, button21, button22]
    }
    
    private func updateViews() {
        guard let board = board else { return }
        
        for x in 0..<3 {
            for y in 0..<3 {
                let coord = (x, y)
                let button = self.button(for: coord)
                if let mark = board[coord] {
                    button.setTitle(mark.stringValue)
                } else {
                    button.setTitle(" ")
                }
            }
        }
        
        if let winner = game.winningPlayer?.stringValue {
            statusLabel.setText("Player \(winner) won!")
        } else if let player = game.activePlayer?.stringValue {
            statusLabel.setText("Player \(player)'s turn")
        } else if game.isOver {
            statusLabel.setText("Cat's game!")
        }
    }
    
    private func button(for coordinate: Coordinate) -> WKInterfaceButton {
        let button = buttons.filter{ $0.coordinates! == coordinate }.first
        return button!
    }
    
    // MARK: - Properties
    
    var board: GameBoard? {
        didSet {
            updateViews()
        }
    }
    
    private var game = Game() {
        didSet {
            board = game.board
            updateViews()
        }
    }
    
    var buttons = [GameboardButton]()
    
    @IBOutlet weak var statusLabel: WKInterfaceLabel!
    
    @IBOutlet weak var button00: GameboardButton!
    @IBOutlet weak var button01: GameboardButton!
    @IBOutlet weak var button02: GameboardButton!
    @IBOutlet weak var button10: GameboardButton!
    @IBOutlet weak var button11: GameboardButton!
    @IBOutlet weak var button12: GameboardButton!
    @IBOutlet weak var button20: GameboardButton!
    @IBOutlet weak var button21: GameboardButton!
    @IBOutlet weak var button22: GameboardButton!
    
}
