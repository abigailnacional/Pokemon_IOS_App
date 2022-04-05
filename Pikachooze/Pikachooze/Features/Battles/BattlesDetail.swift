//
//  BattlesDetail.swift
//  Pikachooze
//
//  Created by Ju Young Yang on 3/29/22.
//

import SwiftUI


struct BattlesDetail: View {
    @ObservedObject var viewModel: FightView


    var body: some View {
        ScrollView {
            VStack{
                leaderImage
                Text(viewModel.gymLeader.name)
                    .font(.headline)
                badgeImage
                leaderPokemons
            }
        }
    }
    
    var leaderImage: some View {
        AsyncImage(url:viewModel.gymLeader.image) { image in
            image
                .resizable()
                .cornerRadius(6)
        } placeholder: {
                ProgressView()
        }
        .frame(width: 50, height: 50)
    }
    var badgeImage: some View{
        AsyncImage(url: viewModel.gymLeader.gymBadge) { image in
            image
                .resizable()
                .cornerRadius(6)
        } placeholder: {
            ProgressView()
        }
        .frame(width: 10, height: 10)
    }
    var leaderPokemons: some View {
        ScrollView {
            VStack{
                AsyncImage(url: viewModel.pokemon.image){
                    image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Image(systemName: "circle")
                }
                .frame(maxWidth: 100, maxHeight: 100)
                Text(viewModel.pokemon.name).font(Font.custom("Minecraft", size: 15))
            }
        }
    }
    
}//end of BattlesDetail

//struct BattlesDetail_Previews: PreviewProvider {
//    static let pokemonStore = PokemonStore()
//    static let viewModel = BattleDetailView(pokemonStore)
//    static var previews: some View {
//        BattlesDetail()
//    }
//}
