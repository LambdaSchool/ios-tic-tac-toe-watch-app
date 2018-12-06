//
//  InterfaceController.swift
//  TicTacToe-watchOS Extension
//
//  Created by Scott Bennett on 12/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    // MARK: - Properties
    
    var mark = "X"
    
    private var game = Game()
    
    @IBOutlet weak var statusLabel: WKInterfaceLabel!
    @IBOutlet weak var square1Label: WKInterfaceButton!
    @IBOutlet weak var square2Label: WKInterfaceButton!
    @IBOutlet weak var square3Label: WKInterfaceButton!
    @IBOutlet weak var square4Label: WKInterfaceButton!
    @IBOutlet weak var square5Label: WKInterfaceButton!
    @IBOutlet weak var square6Label: WKInterfaceButton!
    @IBOutlet weak var square7Label: WKInterfaceButton!
    @IBOutlet weak var square8Label: WKInterfaceButton!
    @IBOutlet weak var square9Label: WKInterfaceButton!
    

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        game.restart()
        clearBoard()
    }
    
    @IBAction func resetButton() {
        game.restart()
        updateViews()
        clearBoard()
        
    }
    @IBAction func square1Button() {
        let coordinate: Coordinate = (0, 0)
        placeMark(markWasMadeAt: coordinate)
        square1Label.setTitle(mark)
        updateViews()
    }
    
    @IBAction func square2Button() {
        let coordinate: Coordinate = (0, 1)
        placeMark(markWasMadeAt: coordinate)
        square2Label.setTitle(mark)
        updateViews()
    }
    
    @IBAction func square3Button() {
        let coordinate: Coordinate = (0, 2)
        placeMark(markWasMadeAt: coordinate)
        square3Label.setTitle(mark)
        updateViews()
    }
    
    @IBAction func square4Button() {
        let coordinate: Coordinate = (1, 0)
        placeMark(markWasMadeAt: coordinate)
        square4Label.setTitle(mark)
        updateViews()
        
    }
    
    @IBAction func square5Button() {
        let coordinate: Coordinate = (1, 1)
        placeMark(markWasMadeAt: coordinate)
        square5Label.setTitle(mark)
        updateViews()
    }
    
    @IBAction func square6Button() {
        let coordinate: Coordinate = (1, 2)
        placeMark(markWasMadeAt: coordinate)
        square6Label.setTitle(mark)
        updateViews()
    }
    
    @IBAction func square7Button() {
        let coordinate: Coordinate = (2, 0)
        placeMark(markWasMadeAt: coordinate)
        square7Label.setTitle(mark)
        updateViews()
    }
    
    @IBAction func square8Button() {
        let coordinate: Coordinate = (2, 1)
        placeMark(markWasMadeAt: coordinate)
        square8Label.setTitle(mark)
        updateViews()
    }
    
    @IBAction func square9Button() {
        let coordinate: Coordinate = (2, 2)
        placeMark(markWasMadeAt: coordinate)
        square9Label.setTitle(mark)
        updateViews()
    }
    
    private func clearBoard() {
        square1Label.setTitle("")
        square2Label.setTitle("")
        square3Label.setTitle("")
        square4Label.setTitle("")
        square5Label.setTitle("")
        square6Label.setTitle("")
        square7Label.setTitle("")
        square8Label.setTitle("")
        square9Label.setTitle("")
        mark = "X"
    }
    
    func placeMark(markWasMadeAt coordinate: Coordinate) {
        do {
            try game.makeMark(at: coordinate)
        } catch {
            NSLog("Illegal move at: \(coordinate)")
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
        
        switch mark {
        case "X":
            mark = "O"
        default:
            mark = "X"
        }
    }
    
   
    
    
    
}
