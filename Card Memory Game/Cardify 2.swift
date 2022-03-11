//
//  Cardify.swift
//  Card Memory Game
//
//  Created by Сергей Иванчихин on 25.01.2022.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    
    init (isShown : Bool) {
        rotation = isShown ? 0 : 180
    }
    
    var animatableData: Double {
        get {rotation}
        set {rotation = newValue}
    }
    
    var rotation : Double
    let cardShape = RoundedRectangle(cornerRadius: UIconstant.cornerRadius)
    func body(content: Content) -> some View {
        ZStack {
            if rotation < 90 {
                cardShape.fill().foregroundColor(.mint)
                cardShape.stroke(.blue, lineWidth: UIconstant.lineWidth)
                
            }  else {
                cardShape.fill().foregroundColor(.indigo)
                cardShape.stroke(.red, lineWidth: 7)
            }
            content
                .opacity(rotation < 90 ? 1 : 0)
        }
        .padding(5)
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }
    
    struct UIconstant {
        static let cornerRadius : CGFloat = 10
        static let lineWidth : CGFloat = 7
    }
}

extension View {
    func cardify(isShown: Bool) -> some View {
        self.modifier(Cardify(isShown: isShown))
    }
}
