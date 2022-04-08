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
            HStack{
                badgeImage
                Text("Congrats, you won!").font(Font.custom("Minecraft", size: 25))
            }
            .foregroundColor(Color.gray)
            .padding(10)
            .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 3)
                    )
            
        }
        
        .padding(.bottom, 50)
    }
    
    var badgeImage: some View{
        AsyncImage(url: viewModel.gymLeader.gymBadge) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(6)
        } placeholder: {
            ProgressView()
        }
        .frame(width: 50, height: 50)
    }
}


//struct Victory_Previews: PreviewProvider {
//    static var previews: some View {
//        Victory(viewModel: FightView)
//    }
//}
