//
//  GameInterfaceController.swift
//  TicTacToeWatch Extension
//
//  Created by Andrew Dhan on 10/24/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import WatchKit
import Foundation



class GameInterfaceController: WKInterfaceController {
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        tiles = [tile1,tile2,tile3,
                 tile4,tile5,tile6,
                 tile7,tile8,tile9]
        
    }
    
    // MARK: - IBActions
    @IBAction func reset() {
        game.restart()
        for tile in tiles{
            tile.setTitle("")
        }
    }
    @IBAction func tile1Tapped() {
        do {
            let mark = game.activePlayer?.stringValue
            tile1.setTitle(mark)
            try game.makeMark(at: (0,0))
        } catch {
            NSLog("Illegal move")
        }
    }
    @IBAction func tile2Tapped() {
        do{
            let mark = game.activePlayer?.stringValue
            tile2.setTitle(mark)
            try game.makeMark(at: (1,0))
        } catch {
            NSLog("Illegal move")
        }
    }
    @IBAction func tile3Tapped() {
        do {
            let mark = game.activePlayer?.stringValue
            tile3.setTitle(mark)
            try game.makeMark(at: (2,0))
        } catch {
            NSLog("Illegal move")
        }
    }
    @IBAction func tile4Tapped() {
        do{
            let mark = game.activePlayer?.stringValue
            tile4.setTitle(mark)
            try game.makeMark(at: (1,0))
        } catch {
            NSLog("Illegal move")
        }
    }
    @IBAction func tile5Tapped() {
        do{
            let mark = game.activePlayer?.stringValue
            tile5.setTitle(mark)
            try game.makeMark(at: (1,1))
        } catch {
            NSLog("Illegal move")
        }
    }
    @IBAction func tile6Tapped() {
        do {
            let mark = game.activePlayer?.stringValue
            tile6.setTitle(mark)
            try game.makeMark(at: (1,2))
        } catch {
            NSLog("Illegal move")
        }
    }
    @IBAction func tile7Tapped() {
        do{
            let mark = game.activePlayer?.stringValue
            tile7.setTitle(mark)
            try game.makeMark(at: (2,0))
        } catch {
            NSLog("Illegal move")
        }
    }
    @IBAction func tile8Tapped() {
        do{
            let mark = game.activePlayer?.stringValue
            tile8.setTitle(mark)
            try game.makeMark(at: (2,1))
        } catch {
            NSLog("Illegal move")
        }
    }
    @IBAction func tile9Tapped() {
        do {
            let mark = game.activePlayer?.stringValue
            tile9.setTitle(mark)
            try game.makeMark(at: (2,2))
        } catch {
            NSLog("Illegal move")
        }
    }
    //MARK: - Private Methods
    func updateLabel(){
        if let winner = game.winningPlayer?.stringValue {
            label.setText("Player \(winner) won!")
        } else if let player = game.activePlayer?.stringValue {
            label.setText("Player \(player)'s turn")
        } else if game.isOver {
            label.setText("Cat's game!")
        }
    }
    
    
    // MARK: - Properties
    private var game = Game(){
        didSet{
            updateLabel()
        }
    }
    
    private var tiles: [WKInterfaceButton]!
    
    //IBOutlets
    @IBOutlet weak var label: WKInterfaceLabel!
    @IBOutlet weak var tile1: WKInterfaceButton!
    @IBOutlet weak var tile2: WKInterfaceButton!
    @IBOutlet weak var tile3: WKInterfaceButton!
    @IBOutlet weak var tile4: WKInterfaceButton!
    @IBOutlet weak var tile5: WKInterfaceButton!
    @IBOutlet weak var tile6: WKInterfaceButton!
    @IBOutlet weak var tile7: WKInterfaceButton!
    @IBOutlet weak var tile8: WKInterfaceButton!
    @IBOutlet weak var tile9: WKInterfaceButton!
}
