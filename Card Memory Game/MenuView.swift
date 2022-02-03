//
//  MenuView.swift
//  Card Memory Game
//
//  Created by Сергей Иванчихин on 30.01.2022.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject var game: EmojiMemoryGame
    @State var animate = false
    
    var body: some View {
        ZStack{
            
            LinearGradient(colors: [.blue,.purple], startPoint: .bottom, endPoint: .top)
            
        NavigationView {
            ScrollView {
            VStack {
                
                NavigationLink("Animals") {
                    EmojiGameView(game: game)
                } .modifier(button(animate: animate))
                    .padding()
                
//                NavigationLink("Transport") {
//
//                    EmojiGameView(game: game)
//                } .modifier(button(animate: animate))
//                    .padding()
//
//                NavigationLink("Fruits") {
//
//                    EmojiGameView(game: game)
//                } .modifier(button(animate: animate))
//                    .padding()
            }
            
            
                .navigationTitle("Choose a game")
            
    }
        }
    }
    }


}


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        MenuView(game: game)
    }
}
