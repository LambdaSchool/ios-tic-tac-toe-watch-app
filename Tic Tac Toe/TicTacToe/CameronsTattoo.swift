//
//  CameronsTattoo.swift
//  TicTacToe
//
//  Created by Nathanael Youngren on 4/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class CameronsTattoo {
    var status: Status = .alive
    
    func findMood() -> Mood {
        
        if self.status == .alive {
            return Mood.grateful
        }
        
        return Mood.sad
    }
}

enum Mood {
    case grateful
    case sad
}

enum Status {
    case alive
    case dead
}
