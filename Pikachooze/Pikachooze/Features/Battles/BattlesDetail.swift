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
                NavigationLink(destination: Fight(viewModel: viewModel)) {
                    Text("BATTLE!")
                        .frame(width: 100)
                        .foregroundColor(Color.red)
                }
                badgeImage
                List(viewModel.gymLeaderPokemon) { pokemon in
                    PokemonRow(pokemon: pokemon)
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
    
 
        

}//end of BattlesDetail

struct PokemonRow: View {
    let pokemon: Pokemon
    
    var body: some View {
        List{
            AsyncImage(url: pokemon.image) { image in
                image
                    .resizable()
            } placeholder: {
                Image(systemName: "circle")
            }
            .frame(maxWidth: 100, maxHeight: 100)
            Text(pokemon.name).font(Font.custom("Minecraft", size:15))
        }
    }
}




//struct BattlesDetail_Previews: PreviewProvider {
//    static let pokemonStore = PokemonStore()
//    static let viewModel = BattleDetailView(pokemonStore)
//    static var previews: some View {
//        BattlesDetail()
//    }
//}
