//
//  BackgroudView.swift
//  Card Memory Game
//
//  Created by Сергей Иванчихин on 01.02.2022.
//

import SwiftUI

struct BackgroudView: View {
    
    //    @State var animate = false
    @State var colors = [Color.blue, Color.indigo, Color.purple, Color.teal, Color.cyan]
    //    @State var colors1 = [Color.cyan, Color.teal, Color.purple, Color.indigo, Color.blue]
    
    
    var body : some View {
        RadialGradient(gradient: Gradient(colors: colors), center: .center, startRadius: 50, endRadius: 400)
            .ignoresSafeArea()
        //            .onAppear {
        //                withAnimation(.linear.repeatForever()) {
        //                    animate.toggle()
        //                }
        //            }
        
    }
}

struct BackgroudView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroudView()
    }
}
