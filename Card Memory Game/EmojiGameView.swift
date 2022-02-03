//
//  EmojiGameView.swift
//  Card Memory Game
//
//  Created by Сергей Иванчихин on 20.01.2022.
//

import SwiftUI

struct EmojiGameView: View {
    @Namespace private var animation
    
    @ObservedObject var game: EmojiMemoryGame
    @State private var dealt = Set<Int>()

    
    private func deal (_ card: EmojiMemoryGame.Card) {
        dealt.insert(card.id)
    }
    
    private func isUnDealt (_ card: EmojiMemoryGame.Card) -> Bool {
        !dealt.contains(card.id)
    }
    
    private func dealAnimation(for card: EmojiMemoryGame.Card) -> Animation {
        var delay = 0.0
        if let index = game.cards.firstIndex(where: {$0.id == card.id}) {
            delay = Double(index) * CardConstant.totalDealDuration / Double (game.cards.count)
        }
        return Animation.easeInOut(duration: CardConstant.dealDuration).delay(delay)
    }
    
    private func zIndex (of card: EmojiMemoryGame.Card) -> Double {
        -Double(game.cards.firstIndex(where: {$0.id == card.id}) ?? 0)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
        VStack {
            gameBody
            HStack {
                shuffle
                Spacer()
                restart
            }.padding()
        }
            deckBody
        }
        .padding()
    }
    
    var gameBody : some View {
        AspectVGrid (items: game.cards, aspectRatio: CardConstant.ratio) {card in
            if isUnDealt(card) || (card.isMatched && !card.isShown) {
                Rectangle().opacity(0)
            } else {
            cardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: animation)
                    .transition(AnyTransition.asymmetric(insertion: .identity, removal: .scale))
                    .zIndex(zIndex(of: card))
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 1)) {
                    game.choose(card)
                    }
                }
            }
        }
        
        .foregroundColor(CardConstant.color)
    }
    
    
    
    var deckBody : some View {
        ZStack {

            ForEach(game.cards.filter(isUnDealt)) {card in
                cardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: animation)
                    .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity))
                    .zIndex(zIndex(of: card))
            }
        }
        .frame(width: CardConstant.undealtWidth, height: CardConstant.undealtHeight)
        .foregroundColor(CardConstant.color)
        .onTapGesture {
            for card in game.cards {
            withAnimation(dealAnimation(for: card)){
                    deal(card)
                }
            }
        }
    }
        
    
    var shuffle : some View {
        Button("Shuffle") {
            withAnimation {
            game.shuffle()
            }
        }
    }
    
    var restart : some View {
        Button("Restart") {
            withAnimation {
                dealt = []
                game.restart()
            }
        }
    }
    
    
    struct CardConstant {
        static var dealDuration : Double = 0.5
        static var totalDealDuration : Double = 2
        static let color : Color = .red
        static let ratio : CGFloat = 2/3
        static let undealtHeight : CGFloat = 90
        static let undealtWidth = undealtHeight * ratio
    }
    
    
}




struct cardView: View {
    
    var card: EmojiMemoryGame.Card
    
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
//                Pie(startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 50))
//                    .padding(5)
//                    .opacity(0.4)
                Text(card.content)
                    .scaleEffect(card.isMatched ? 1.2 : 0.8)
                    .animation(Animation.easeInOut(duration: 1).repeatForever())
                    .scaleEffect(scale(thatFits: geometry.size))
            }.padding(6)
                .cardify(isShown: card.isShown)
        }
    }
    
    private func scale (thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (CardConstant.fontSize / CardConstant.emojiScale)
    }
    
    private func font (in size: CGSize) -> Font {
        Font.system(size: min(size.height, size.height) * CardConstant.emojiScale)
    }
    
    
    
    
    struct CardConstant {
        static let emojiScale : CGFloat = 1
        static let fontSize : CGFloat = 32
    }
    
}






















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiGameView(game: game)
    }
}
