//
//  EmojiViewModel.swift
//  Card Memory Game
//
//  Created by Сергей Иванчихин on 20.01.2022.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let animals = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐧", "🐦", "🐤", "🦆", "🦅", "🦉", "🐺", "🐗", "🐴", "🦄"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairs: 10) {
            pairIndex in animals[pairIndex]
        }
    }
    
    @Published private var model  = createMemoryGame()
    
    var cards: Array <Card> {
        model.cards
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle () {
        model.shuffle()
    }
    
    func restart () {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
