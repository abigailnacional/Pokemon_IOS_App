
import SwiftUI

struct Battles: View {
    @StateObject var viewModel: BattleView
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach((viewModel.gymLeaders), id: \.self) { gymLeader in
                    NavigationLink(destination: BattlesDetail(viewModel: BattleDetailView(gymLeader, viewModel.pokeStore))) {
                        GymLeaderRow(gymLeader: gymLeader)
                    }
                }
            }
        }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Battle").font(Font.custom("Minecraft", size: 48))
                        .padding(.top, 20)
            }
        /*
        VStack {
            Text("Battles").font(Font.custom("Minecraft", size: 30))
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach((viewModel.gymLeaders), id: \.self) { gymLeader in
                        NavigationLink(destination: BattlesDetail(viewModel: BattleDetailView(gymLeader, viewModel.pokeStore))) {
                            GymLeaderRow(gymLeader: gymLeader)
                        }
                    }
                }
            }
            .padding(.top, 10)*/
        }

        /*
        List(viewModel.gymLeaders) { gymleader in
            NavigationLink(destination: BattlesDetail(viewModel: BattleDetailView(gymleader, viewModel.pokeStore))) {
             GymLeaderRow(gymLeader: gymleader)
            }
            .navigationTitle("Battles")
        }*/
    }
}

/*
 ScrollView {
     LazyVGrid(columns: columns) {
         ForEach((viewModel.filteredPokemon), id: \.self) { pokemon in
             NavigationLink(destination: PokemonDetail(viewModel: PokemonDetailView(pokemon, viewModel.pokemonStore))
             ) {
                 SearchRow(pokemon: pokemon)
             }
         }
     }
     .searchable(text: $viewModel.searchText)
     .disableAutocorrection(true)
     .navigationTitle("Choose Your Pokemon!")
 */

struct GymLeaderRow: View {
    let gymLeader: GymLeader
    
    var body: some View {
        VStack {
            leaderImage
            VStack(alignment: .center) {
                Text(gymLeader.name).font(Font.custom("Minecraft", size: 20))
                Text(gymLeader.city).font(Font.custom("Minecraft", size: 15))
                badgeImage
            }
        }
        .foregroundColor(Color.gray)
        .padding(30)
        .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 3)
                )
    }
    
    var leaderImage: some View {
        AsyncImage(url:gymLeader.image) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
                ProgressView()
        }
        .frame(maxWidth: 100, maxHeight: 100)
    }
    
    var badgeImage: some View{
        AsyncImage(url: gymLeader.gymBadge) { image in
            image
                .resizable()
                .cornerRadius(6)
        } placeholder: {
            ProgressView()
        }
        .frame(width: 10, height: 10)
    }
    
}








//
//struct Battles_Previews: PreviewProvider {
//    static let pokeStore = PokemonStore()
//    static let gymLeader: GymLeader
//    static let viewModel = BattleView(gymLeader: gymLeader, pokeStore: pokeStore)
//    static var previews: some View {
//        Battles(viewModel: viewModel)
//    }
//}
