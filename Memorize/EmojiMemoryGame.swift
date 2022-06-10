//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by David Nguyen on 10/06/2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    static let emoji = ["⛴","✈️", "🚘", "🚌", "🧩", "🛵"
                        ,"🎤", "🎧", "🎼", "🥁", "🎲", "🎳"
                        , "🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emoji[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
