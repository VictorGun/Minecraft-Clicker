//
//  ClickerView.swift
//  Minecraft Clicker
//
//  Created by Victor Gunderson on 11/28/22.
//

import SwiftUI
import AVFoundation

struct ClickerView: View {
    @State private var score = 0
    @State public var randomValue = 0
    @State private var levelUp = ""
    @State private var player: AVAudioPlayer!
    @State private var showingAlert = false
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
                .frame(width: 200, height: 200, alignment: .center)
                .onTapGesture {
                    playSounds(sound: "minecraftBreak")
                    chooseRandom(times: 1)
                    score += 1
                    
                    if score % 100 == 0 {
                        levelUp = "CONGRADULATIONS! YOU LEVELED UP!"
                        playSounds(sound: "minecraftLevel")
                    } else {
                        levelUp = ""
                    }
                    if score == 1000 {
                        levelUp = "CONGRADULATIONS! YOU MADE IT TO LEVEL MAX!"
                        showingAlert = true
                        playSounds(sound: "minecraftWin")
                    }
                }
                .alert("Important message", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
            Spacer()
            Text("\(levelUp)") .foregroundColor(.green)
                .font(Font.custom("Impact", size: 20))
                .fontWeight(.bold)
        }
        .alert("CONGRADULATIONS YOU GOT TO MAX LEVEL! PRESS OK TO CONTINUE OR PRESS BACK TO GO TO MAIN MENU", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
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


struct ClickerView_Previews: PreviewProvider {
    static var previews: some View {
        ClickerView()
    }
}
