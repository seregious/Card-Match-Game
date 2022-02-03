//
//  EmojiViewModel.swift
//  Card Memory Game
//
//  Created by Сергей Иванчихин on 20.01.2022.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    

    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairs: 10) {pairIndex in
            fruits[pairIndex]
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


    static var emojies = ["🥸","🥸","🥸","🥸"]
    
    static var animals = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐧", "🐦", "🐤", "🦆", "🦅", "🦉", "🐺", "🐗", "🐴", "🦄"]
    
    static var fruits = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥥", "🥝"]
    
    static var food = ["🥐", "🥯", "🍞", "🥖", "🥨", "🧀", "🍳", "🍗", "🌭", "🍔", "🍟", "🍕", "🌮", "🌯", "🥗", "🥘", "🍦", "🥧", "🧁", "🍰", "🍭", "🍬", "🍫", "🍿", "🍩", "🍪"]
    
    static var transport = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚑", "🚒", "🚜", "🛵", "🚔", "🚍", "🚠", "🚟", "🚂", "✈️", "🚀", "🛸", "🚁", "🛶", "⛵️"]
    
    static var counties = ["🏴‍☠️", "🏳️‍🌈", "🇦🇺", "🇦🇹", "🇦🇿", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇮", "🇦🇴", "🇦🇩", "🇦🇶", "🇦🇬", "🇦🇷", "🇦🇲", "🇮🇴", "🇧🇧", "🇧🇪", "🇧🇬", "🇧🇶", "🇧🇷", "🇬🇧", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🇻🇳", "🇳🇱", "🇰🇷", "🇫🇮"]
    
    static var haloween = ["👻", "💀", "☠️", "👽", "🦴", "🪓", "😱", "🥶", "🤢", "😈", "👹", "👺", "🤡", "👾", "🤖", "🎃", "🧙‍♂️", "🧝‍♀️", "🧛‍♂️", "🧟‍♀️"]
    
    static var people = ["👮‍♀️", "👷‍♀️", "💂‍♀️", "🕵️‍♀️", "👩‍⚕️", "👩‍🌾", "👩‍🍳", "👩‍🎓", "👩‍🎤", "👩‍🏫", "👩‍🏭", "👩‍💻", "👩‍🔬", "👩‍🎨", "👩‍🚒", "👩‍✈️", "👩‍🚀", "👩‍⚖️", "👸", "🥷"]

}

