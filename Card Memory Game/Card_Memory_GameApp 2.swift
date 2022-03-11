//
//  Card_Memory_GameApp.swift
//  Card Memory Game
//
//  Created by Сергей Иванчихин on 20.01.2022.
//

import SwiftUI

@main
struct Card_Memory_GameApp: App {
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiGameView(game: game)
        }
    }
}
