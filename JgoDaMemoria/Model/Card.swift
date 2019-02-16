//
//  Card.swift
//  JgoDaMemoria
//
//  Created by posmobile on 16/02/19.
//  Copyright © 2019 posmobile. All rights reserved.
//

import Foundation

struct Card {
    var identifier: Int
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        identifier = Card.getUniqueIdentifier()
    }
}
