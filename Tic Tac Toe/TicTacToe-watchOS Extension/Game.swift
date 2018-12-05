//
//  Game.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

enum GameError: Error {
    case gameOver
}

struct Game {
    
    private enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    mutating func restart() {
        board = GameBoard()
        gameState = .active(.x)
    }
    
    mutating func makeMark(at coordinate: Coordinate) throws {
        guard case let GameState.active(player) = gameState else {
            throw GameError.gameOver
        }
        
        try board.place(mark: player, on: coordinate)
        if game(board: board, isWonBy: player) {
            // Current player one
            gameState = .won(player)
        } else if board.isFull {
            // Nobody won, cat's game
            gameState = .cat
        } else {
            // Switch to next player
            let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
            gameState = .active(newPlayer)
        }
    }
    
    private(set) var board = GameBoard()
    private var gameState = GameState.active(.x) {
        didSet {
            switch gameState {
            case .active(let player):
                winningPlayer = nil
                isOver = false
                activePlayer = player
            case .cat:
                winningPlayer = nil
                isOver = true
                activePlayer = nil
            case .won(let player):
                winningPlayer = player
                isOver = true
                activePlayer = nil
            }
        }
    }
    
    var activePlayer: GameBoard.Mark? = .x
    var isOver: Bool = false
    var winningPlayer: GameBoard.Mark? = nil
}
