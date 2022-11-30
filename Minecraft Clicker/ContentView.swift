//
//  ContentView.swift
//  Minecraft Clicker
//
//  Created by Victor Gunderson on 11/28/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 500)
                Text("MINECRAFT CLICKER").foregroundColor(.green)
                    .font(Font.custom("Impact", size: 40))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(height: 400)
                
                NavigationLink(destination: ClickerView()) {
                    Label("PLAY", systemImage: "")
                        .font(Font.custom("impact", size: 25))
                        .foregroundColor(.green)
                    
                }
                .padding(50)
                NavigationLink(destination: TutorialView()) {
                    Label("TUTORIAL", systemImage: "")
                        .font(Font.custom("impact", size: 25))
                        .foregroundColor(.green)
                }
                Spacer()
                    .frame(height: 400)
            } .background(
                ZStack {
                    Image("minecraft")
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

