//
//  TutorialView.swift
//  Minecraft Clicker
//
//  Created by Victor Gunderson on 11/28/22.
//

import SwiftUI
import AVFoundation

struct TutorialView: View {
    @State private var player: AVAudioPlayer!
    var body: some View {
            VStack {
                Spacer()
                Text("HOW TO PLAY").foregroundColor(.green)
                    .font(Font.custom("impact", size: 50))
                Spacer()
                Text("""
• CLICK ON THE BLOCK TO DESTROY IT

• EVERY TIME YOU DESTROY A BLOCK YOU GET POINTS

• IF YOU GET TO 1000 POINTS YOU WIN

""") .font(Font.custom("impact", size: 25))
                    .foregroundColor(.green)
                    .padding(5)
                Spacer()
            } .background(
                ZStack {
                    Image("minecraft")
                }
            )
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

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
