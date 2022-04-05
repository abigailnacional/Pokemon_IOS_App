//
//  BattlesDetail.swift
//  Pikachooze
//
//  Created by Ju Young Yang on 3/29/22.
//

import SwiftUI


struct BattlesDetail: View {
    @StateObject var viewModel: BattleDetailView
    
    var body: some View {
        ScrollView {
            VStack{
                leaderImage
                Text(viewModel.gymLeader.name)
                    .font(.headline)
                badgeImage
                List(viewModel.gymLeaderPokemon) {
                    leaderPokemons
                }
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
    //WORKING
    var leaderPokemons: some View {
        let pokemon: Pokemon
                AsyncImage(url: pokemon.image){ image in
                    image
                        .resizable()
                } placeholder: {
                    Image(systemName: "circle")
                }
                .frame(maxWidth: 50, maxHeight: 50)
                Text(pokemon.name).font(Font.custom("Minecraft", size: 15))
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
