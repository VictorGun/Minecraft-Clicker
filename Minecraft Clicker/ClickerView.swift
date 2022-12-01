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
            Image("block \(randomValue)")
                .resizable()
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .onTapGesture {
                    chooseRandom(times: 1)
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
    func chooseRandom(times:Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                randomValue = Int.random(in: 1...5)
                chooseRandom(times: times - 1)
            }
        }
    }
}


struct ClickerView_Previews: PreviewProvider {
    static var previews: some View {
        ClickerView()
    }
}
