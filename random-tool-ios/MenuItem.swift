//
//  MenuItem.swift
//  random-tool-ios
//
//  Created by Darius Vilcinskis on 02/11/2017.
//  Copyright © 2017 Darius Vilcinskis. All rights reserved.
//

import Foundation

enum MenuItem
{
    case randomNumber
    case diceRolls
    case coinFlip
    case listRandomizer
    case winnerSelection
    case decision
    
    var name:String {
        get {
            switch self {
                case .randomNumber: return "Random Number"
                case .diceRolls: return "Dice Rolls"
                case .coinFlip: return "Coin Flip"
                case .listRandomizer: return "List Randomizer"
                case .winnerSelection: return "Winner Selection"
                case .decision: return "Decision"
            }
        }
    }
    
    var iconName:String {
        get {
            switch self {
                case .randomNumber: return "randomNumber"
                case .diceRolls: return "diceRolls"
                case .coinFlip: return "diceRolls"
                case .listRandomizer: return "listRandomizer"
                case .winnerSelection: return "winnerSelection"
                case .decision: return "decision"
            }
        }
    }
}
