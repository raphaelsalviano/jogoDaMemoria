//
//  Game.swift
//  JgoDaMemoria
//
//  Created by posmobile on 16/02/19.
//  Copyright © 2019 posmobile. All rights reserved.
//

import Foundation

class Game {
    var cards: Array<Card> = []
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairsOfCard: Int) {
        for _ in 1...numberOfPairsOfCard {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
    func chooseCard(at index: Int) {
        if (!cards[index].isMatched) {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                indexOfOneAndOnlyFaceUpCard = nil
                
                if cards[index].identifier == cards[matchIndex].identifier {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
            } else {
                for tempIndex in cards.indices {
                    cards[tempIndex].isFaceUp = false
                }
                indexOfOneAndOnlyFaceUpCard = index
            }
            cards[index].isFaceUp = true
        }
        
        // cards[index].isFaceUp = !cards[index].isFaceUp
    }
    
    func shufleCards() {
        cards.shuffle()
    }
    
    func restartCards() {
        for index in cards.indices {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        shufleCards()
    }
}
