//
//  TutorialView.swift
//  Minecraft Clicker
//
//  Created by Victor Gunderson on 11/28/22.
//

import SwiftUI

struct TutorialView: View {
    var body: some View {
            VStack {
                Spacer()
                Text("HOW TO PLAY").foregroundColor(.green)
                    .font(Font.custom("impact", size: 50))
                Spacer()
                Text("""
• CLICK ON THE BLOCK TO DESTROY IT

• EVERY TIME YOU DESTROY A BLOCK YOU GET POINTS

• IF YOU GET TO ___ POINTS YOU WIN

• BUY PICKAXES IN THE SHOP SECTION. BETTER THE PICKAXE... HIGHER POINTS YOU GET PER BLOCK

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
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
