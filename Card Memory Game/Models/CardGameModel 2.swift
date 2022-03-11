//
//  CardGameModel.swift
//  Card Memory Game
//
//  Created by Сергей Иванчихин on 20.01.2022.
//

import Foundation

struct MemoryGame <CardContent> where CardContent : Equatable {
    
    struct Card : Identifiable {
        var id: Int
        var isShown = false
        var isMatched = false
        var content : CardContent
    }
    
    mutating func shuffle () {
        cards.shuffle()
    }
    
    private var indexOfOnlyShownCard : Int?
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isShown,
           !cards[chosenIndex].isMatched
        {
            if let potentionalMatchIndex = indexOfOnlyShownCard {
                if cards[chosenIndex].content == cards[potentionalMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentionalMatchIndex].isMatched = true
                }
                indexOfOnlyShownCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isShown = false
                }
                indexOfOnlyShownCard = chosenIndex
            }
        cards[chosenIndex].isShown.toggle()
        }
    }

    
    var cards = [Card]()
    
    init (numberOfPairs: Int, createCardContent: (Int) -> CardContent) {
        cards = [Card]()
        
        for pairIndex in 0..<numberOfPairs {
            let content : CardContent = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
        cards.shuffle()
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
