//
//  GameState.swift
//  RPS_2
//
//  Created by James Chun on 11/25/18.
//  Copyright © 2018 James Chun. All rights reserved.
//

import Foundation
import UIKit

enum GameState {
    case start
    case win
    case lose
    case draw
    
    var value: Int {
        switch self {
        case .start: return 0
        case .win: return 1
        case .lose: return 2
        case .draw: return 3
        }
    }
    
    var message: String {
        switch self {
        case .start: return "Rock, paper, scissors!"
        case .win: return "You win!"
        case .lose: return "You lose...🤭🤣🙊"
        case .draw: return "Again!"
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .start: return UIColor(red: 121/255, green: 121/255, blue: 121/255, alpha: 1)
        case .win: return UIColor(red: 173/255, green: 200/255, blue: 169/255, alpha: 1)
        case .lose: return UIColor(red: 217/255, green: 153/255, blue: 129/255, alpha: 1)
        case .draw: return UIColor(red: 121/255, green: 121/255, blue: 121/255, alpha: 1)
        }
    }
    
}
