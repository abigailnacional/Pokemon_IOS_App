//
//  Victory.swift
//  Pikachooze
//
//  Created by Ju Young Yang on 3/31/22.
//

import SwiftUI

struct Victory: View {
    @StateObject var viewModel: FightView

    var body: some View {
        Spacer()
        VStack(alignment: .center){
            Image("victory")
            Image("happi")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Congrats, you won!").font(Font.custom("Minecraft", size: 15))
        }
        .padding(.bottom, 50)
    }
}

//struct Victory_Previews: PreviewProvider {
//    static var previews: some View {
//        Victory(viewModel: FightView)
//    }
//}
