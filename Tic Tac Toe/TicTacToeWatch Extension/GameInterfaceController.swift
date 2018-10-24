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
        // Configure interface objects here.
    }
    
    // MARK: - IBActions
    @IBAction func reset() {
    }
    @IBAction func tile1Tapped() {
    }
    @IBAction func tile2Tapped() {
    }
    @IBAction func tile3Tapped() {
    }
    @IBAction func tile4Tapped() {
    }
    @IBAction func tile5Tapped() {
    }
    @IBAction func tile6Tapped() {
    }
    @IBAction func tile7Tapped() {
    }
    @IBAction func tile8Tapped() {
    }
    @IBAction func tile9Tapped() {
    }
    
    
    
    // MARK: - Properties
    let gameBoard = GameBoard()
    
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
