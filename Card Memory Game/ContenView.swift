//
//  ContenView.swift
//  Card Memory Game
//
//  Created by Сергей Иванчихин on 01.02.2022.
//

import SwiftUI

struct button: ViewModifier {
    var animate : Bool
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .font(.largeTitle)
            .foregroundColor(.white)
            .shadow(color: .blue, radius: 10, x: 5, y: 5)
            .background(.red)
            .cornerRadius(10)
            
            
    }
}
