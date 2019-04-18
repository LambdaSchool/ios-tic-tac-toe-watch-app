//
//  GameInterfaceController.swift
//  TicTacToe-watchOS Extension
//
//  Created by Nathanael Youngren on 4/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import WatchKit
import Foundation
import TicTacToeCore

class GameInterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    @IBAction func boardSpaceOneTapped() {
        mark(at: 0)
    }
    
    @IBAction func boardSpaceTwoTapped() {
        mark(at: 1)
    }
    
    @IBAction func boardSpaceThreeTapped() {
        mark(at: 2)
    }
    
    @IBAction func boardSpaceFourTapped() {
        mark(at: 3)
    }
    
    @IBAction func boardSpaceFiveTapped() {
        mark(at: 4)
    }
    
    @IBAction func boardSpaceSixTapped() {
        mark(at: 5)
    }
    
    @IBAction func boardSpaceSevenTapped() {
        mark(at: 6)
    }
    
    @IBAction func boardSpaceEightTapped() {
        mark(at: 7)
    }
    
    @IBAction func boardSpaceNineTapped() {
        mark(at: 8)
    }
    
    @IBAction func resetButtonTapped() {
        game.restart()
        gameStatusLabel.setText("Player X's turn")
        updateButtons()
    }
    
    private func mark(at number: Int) {
        do {
            try game.makeMark(at: coordinate(for: number))
        } catch {
            NSLog("Illegal move")
        }
        updateViews()
        updateButtons()
    }
    
    private func updateButtons() {
        let board = game.board
        for x in 0..<3 {
            for y in 0..<3 {
                let coord = (x, y)
                let button = self.button(for: coord)
                if let mark = board[coord] {
                    button?.setTitle(mark.stringValue)
                } else {
                    button?.setTitle(" ")
                }
            }
        }
    }
    
    private func button(for coordinate: Coordinate) -> WKInterfaceButton? {
        let tag = coordinate.y * 3 + coordinate.x
        switch tag {
        case 0:
            return boardSpaceOneButton
        case 1:
            return boardSpaceTwoButton
        case 2:
            return boardSpaceThreeButton
        case 3:
            return boardSpaceFourButton
        case 4:
            return boardSpaceFiveButton
        case 5:
            return boardSpaceSixButton
        case 6:
            return boardSpaceSevenButton
        case 7:
            return boardSpaceEightButton
        case 8:
            return boardSpaceNineButton
        default:
            return nil
        }
    }
    
    private func coordinate(for spaceNumber: Int) -> Coordinate {
        let tag = spaceNumber
        let x = tag % 3
        let y = tag / 3
        return (x, y)
    }
    
    private func updateViews() {
        if let winner = game.winningPlayer?.stringValue {
            gameStatusLabel.setText("Player \(winner) won!")
        } else if let player = game.activePlayer?.stringValue {
            gameStatusLabel.setText("Player \(player)'s turn")
        } else if game.isOver {
            gameStatusLabel.setText("Cat's game!")
        }
    }
    
    @IBOutlet weak var gameStatusLabel: WKInterfaceLabel!
    @IBOutlet weak var boardSpaceOneButton: WKInterfaceButton!
    @IBOutlet weak var boardSpaceTwoButton: WKInterfaceButton!
    @IBOutlet weak var boardSpaceThreeButton: WKInterfaceButton!
    @IBOutlet weak var boardSpaceFourButton: WKInterfaceButton!
    @IBOutlet weak var boardSpaceFiveButton: WKInterfaceButton!
    @IBOutlet weak var boardSpaceSixButton: WKInterfaceButton!
    @IBOutlet weak var boardSpaceSevenButton: WKInterfaceButton!
    @IBOutlet weak var boardSpaceEightButton: WKInterfaceButton!
    @IBOutlet weak var boardSpaceNineButton: WKInterfaceButton!
    
    private var game = Game()
}
