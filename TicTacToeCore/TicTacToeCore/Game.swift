//
//  Game.swift
//  TicTacToeCore
//
//  Created by Nathanael Youngren on 4/17/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import Foundation

enum GameError: Error {
    case gameOver
}

public struct Game {
    
    public init() {}
    
    private enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    mutating public func restart() {
        board = GameBoard()
        gameState = .active(.x)
    }
    
    mutating public func makeMark(at coordinate: Coordinate) throws {
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
    
    public var board = GameBoard()
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
    
    public var activePlayer: GameBoard.Mark? = .x
    public var isOver: Bool = false
    public var winningPlayer: GameBoard.Mark? = nil
}
