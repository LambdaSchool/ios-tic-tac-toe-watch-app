//
//  GameController.swift
//  TicTacToeWatch Extension
//
//  Created by Linh Bouniol on 10/24/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class GameController {
    
    static var shared = GameController()
    
    var games: [Game] = []
    
    func add(game: Game) {
        games.insert(game, at: 0) // want every entry to be added at the beginning
    }
}
