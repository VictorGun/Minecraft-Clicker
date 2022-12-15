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
    // Counts score by 1 when block is clicked
    @State public var randomBlock = 0
    // chooses from the 5 blocks
    @State private var levelUp = ""
    // Text shows when you get to 100 clicks
    @State private var player: AVAudioPlayer!
    // variable for audio
    @State private var showingAlert = false
    // alert is not present until some thing happens
    var body: some View {
        VStack {
            Text("CLICK THE BLOCK") .foregroundColor(.black)
                .font(Font.custom("Impact", size: 40))
                .fontWeight(.bold)
                .padding()
            Text("\(score)")
                .font(Font.custom("Impact", size: 20))
            // Variable usage so score updates
            Spacer()
            Image("block \(randomBlock)")
                // chooses image from assets from the blocks folder
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
            // resizes image
                .onTapGesture {
                    playSounds(sound: "minecraftBreak")
                    // plays sound when block clicked
                    chooseRandom(times: 1)
                    // chooses a random block once when clicked once
                    score += 1
                    // adds 1 to score
                    if score % 100 == 0 {
                        // Each 100 points you level up
                        levelUp = "CONGRADULATIONS! YOU LEVELED UP!"
                        playSounds(sound: "minecraftLevel")
                    } else {
                        levelUp = ""
                        // text clears when you arent at the level/havent reached the next level or first
                    }
                    if score == 1000 {
                        // Finished game at 1000 points, can continue playing
                        levelUp = "CONGRADULATIONS! YOU MADE IT TO LEVEL MAX!"
                        showingAlert = true
                        playSounds(sound: "minecraftWin")
                    }
                }
            Spacer()
            Text("\(levelUp)") .foregroundColor(.green)
                .font(Font.custom("Impact", size: 20))
                .fontWeight(.bold)
                // This shows when you level up
        }
        .alert("CONGRADULATIONS YOU GOT TO MAX LEVEL! PRESS OK TO CONTINUE OR PRESS BACK TO GO TO MAIN MENU", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
            // normal alert usage, alert is presented when showing alert = true (1000 points)
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
                // when clicked the block changes immediately
                randomBlock = Int.random(in: 1...5)
                //chooses random block 1...5
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
