//
//  ViewController.swift
//  JgoDaMemoria
//
//  Created by posmobile on 16/02/19.
//  Copyright © 2019 posmobile. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var emojis = "🐶🦊🐻🐼🐨🐯🦁🐮🐷🐸🐤🐺🦋"
    
    var emojiDictionary: [Int: String] = [:]
    
    var flips = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flips)"
        }
    }
    
    lazy var game = Game(numberOfPairsOfCard: cardButtons.count / 2)

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!

    @IBAction func touchCard(_ sender: UIButton) {
        if let index = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: index)
            updateViewFromModel()
        }        
    }
    
    @IBAction func resetCards(_ sender: UIButton) {
        game.restartCards()
        updateViewFromModel()
        flips = 0
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if (card.isFaceUp) {
                button.backgroundColor = #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
            } else {
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
                button.setTitle("?", for: UIControl.State.normal)
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if let emoji = emojiDictionary[card.identifier] {
            return emoji
        }
        let newEmoji = String(emojis.removeFirst())
        emojiDictionary.updateValue(newEmoji, forKey: card.identifier)
        return newEmoji
    }
 
}

