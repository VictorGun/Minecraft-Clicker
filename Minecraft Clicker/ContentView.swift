//
//  ContentView.swift
//  Minecraft Clicker
//
//  Created by Victor Gunderson on 11/28/22.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var player: AVAudioPlayer!
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
                        .onSubmit {
                            playSounds(sound: "MinecraftCLick")
                        }
                    
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
    func playSounds(sound: String) {
        if let asset = NSDataAsset(name: sound){
            do {
                // Use NSDataAsset's data property to access the audio file stored in Sound.
                player = try AVAudioPlayer(data:asset.data, fileTypeHint:"wav")
                // Play the above sound file.
                player?.play()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

