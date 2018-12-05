//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    @IBAction func restartGame(_ sender: Any) {
        game.restart()
    }

    // MARK: - BoardViewControllerDelegate

    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        do {
            try game.makeMark(at: coordinate)
        } catch {
            NSLog("Illegal move")
        }
    }

    // MARK: - Private

    private func updateViews() {
        guard isViewLoaded else { return }

        if let winner = game.winningPlayer?.stringValue {
            statusLabel.text = "Player \(winner) won!"
        } else if let player = game.activePlayer?.stringValue {
            statusLabel.text = "Player \(player)'s turn"
        } else if game.isOver {
            statusLabel.text = "Cat's game!"
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = segue.destination as? BoardViewController
        }
    }

    private var boardViewController: BoardViewController! {
        didSet {
            boardViewController?.board = game.board
            boardViewController?.delegate = self
        }
    }

    @IBOutlet weak var statusLabel: UILabel!

    private var game = Game() {
        didSet {
            boardViewController.board = game.board
            updateViews()
        }
    }
}
