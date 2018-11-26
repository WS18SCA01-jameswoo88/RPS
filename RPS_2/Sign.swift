//
//  Sign.swift
//  RPS_2
//
//  Created by James Chun on 11/25/18.
//  Copyright © 2018 James Chun. All rights reserved.
//

import Foundation
import GameplayKit


let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

struct RockPaperScissor {
    let emoji: String
    let value: Int
    let sign: Sign
}

enum Sign {
    case rock
    case paper
    case scissors
    
    var emoji: String {
        switch self {
        case .rock: return "👊"
        case .paper: return "✋"
        case .scissors: return "✌️"
        }
    }
    
    var value: Int {
        switch self {
        case .rock: return 0
        case .paper: return 1
        case .scissors: return 2
        }
    }
    
    func compare(opponentSign: Sign) -> GameState {
        let difference: Int = self.value - opponentSign.value
        
        switch difference {
        case -2, 1: return GameState.win
        case 2, -1: return GameState.lose
        default: return GameState.draw
        }
    }
    
}

