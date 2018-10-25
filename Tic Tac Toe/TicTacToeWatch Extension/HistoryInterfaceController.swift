//
//  HistoryInterfaceController.swift
//  TicTacToeWatch Extension
//
//  Created by Linh Bouniol on 10/24/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import WatchKit
import Foundation


class HistoryInterfaceController: WKInterfaceController {

    @IBOutlet weak var table: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        
    }

    override func willActivate() {
        super.willActivate()
        
        table.setNumberOfRows(GameController.shared.games.count, withRowType: "HistoryRow")
        
        for (index, game) in GameController.shared.games.enumerated() {
            let cell = table.rowController(at: index) as! HistoryCell
            
            if let winner = game.winningPlayer?.stringValue {
                cell.label.setText("Player \(winner) won!")
            } else if let player = game.activePlayer?.stringValue {
                cell.label.setText("Player \(player)'s turn")
            } else if game.isOver {
                cell.label.setText("Cat's game!")
            }
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
