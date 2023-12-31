//
//  Defeat.swift
//  Pikachooze
//
//  Created by Ju Young Yang on 3/31/22.
//

import SwiftUI

struct Defeat: View {
    //@StateObject var viewModel: FightView
    var gymBadgeURL : URL
    
    var body: some View {
        Spacer()
        VStack(alignment: .center){
            Image("defeat")
            Image("sadd")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("You lost :(. Choose better Pokemon next time!").font(Font.custom("Minecraft", size: 25))
                .foregroundColor(Color.gray)
                .padding(10)
                .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 3)
                        )
        }
        .padding(.bottom, 50)
    }
}

//struct Defeat_Previews: PreviewProvider {
//    static var previews: some View {
//        Defeat()
//    }
//}
