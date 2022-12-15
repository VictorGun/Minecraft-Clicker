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
            // Navigation View used for switching through views. (where the Navigation Links are)
            VStack {
                Spacer()
                    .frame(height: 500)
                // Multiple Spacers with frame heights to adjust where the text is
                Text("MINECRAFT CLICKER").foregroundColor(.green) // green text
                    .font(Font.custom("Impact", size: 40)) // impact font use
                    .fontWeight(.bold) // bold text
                    .multilineTextAlignment(.center) // center alignment for text
                Spacer()
                    .frame(height: 400)
                
                NavigationLink(destination: ClickerView()) {
                    Label("PLAY", systemImage: "")
                        .font(Font.custom("impact", size: 25))
                        .foregroundColor(.green)
                }
                // These 2 navigations links bring you to a view. First brings you to clicker view. Second brings you to Tutorial view.
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
                        // usage of background image in the back
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

