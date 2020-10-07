//
//  CardModel.swift
//  WarCardGame
//
//  Created by Olajuwon Adeola on 10/5/20.
//

import Foundation


public struct Card {
    let suit: Suit
    let rank: Rank
}


public enum Rank: Int {
    case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King, Ace
}

public enum Suit: Int {
    case Clover
    case Diamond
    case Heart
    case Spade
}


func createDeck() -> [Card] {
    var cards = [Card]()
    
    for rankValue in 2 ... 14 {
                for suitValue in 0 ..< 4 {
                    let suit = Suit(rawValue: suitValue)!
                    let rank = Rank(rawValue: rankValue)!
     
                    cards += [Card(suit: suit, rank: rank)]
                }
            }
            return cards
}
