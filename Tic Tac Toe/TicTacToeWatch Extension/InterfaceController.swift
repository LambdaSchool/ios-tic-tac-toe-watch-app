//
//  InterfaceController.swift
//  TicTacToeWatch Extension
//
//  Created by De MicheliStefano on 24.10.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    // MARK: - Properties
    @IBOutlet weak var statusLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    @IBAction func reset() {
        // game.reset()
    }
    
}
