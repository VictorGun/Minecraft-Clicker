//
//  ClickerView.swift
//  Minecraft Clicker
//
//  Created by Victor Gunderson on 11/28/22.
//

import SwiftUI

struct ClickerView: View {
    @State private var score = 0
    @State public var randomValue = 0
    var body: some View {
        VStack {
            Text("CLICK THE BLOCK") .foregroundColor(.black)
                .font(Font.custom("Impact", size: 40))
                .fontWeight(.bold)
                .padding()
            Text("\(score)")
                .font(Font.custom("Impact", size: 20))
            Spacer()
            Image("clickerBlock")
                .onTapGesture {
                    score += 1
                }
            Spacer()
            
        }
        .background(
            ZStack {
                Image("minecraftBackgroundC")
            }
        )
    }
}

struct ClickerView_Previews: PreviewProvider {
    static var previews: some View {
        ClickerView()
    }
}
