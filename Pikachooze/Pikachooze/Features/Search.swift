
import SwiftUI

struct Search: View {
    @StateObject var viewModel: SearchView
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
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
        }
        /*
        List(viewModel.filteredPokemon) { pokemon in
            NavigationLink(destination: PokemonDetail(viewModel: PokemonDetailView(pokemon, viewModel.pokemonStore))
            ) {
                SearchRow(pokemon: pokemon)
            }
        }
        .searchable(text: $viewModel.searchText)
        .disableAutocorrection(true)
        .navigationTitle("Choose Your Pokemon!")*/
    }
}


struct SearchRow: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack{
            AsyncImage(url: pokemon.image){
                image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: "circle")
            }
            .frame(maxWidth: 100, maxHeight: 100)
            Text(pokemon.nickname ?? pokemon.name)
                .font(Font.custom("Minecraft", size: 15))
        }
        .foregroundColor(Color.gray)
        .padding(10)
        .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 3)
                )
        //.border(Color.gray, width: 5)
        //.cornerRadius(10)
    }
}

//struct Search_Previews: PreviewProvider {
//    static var previews: some View {
//        Search(viewModel: SearchView(apiService: PokemonAPIService()), viewM: PokemonDetailView(apiService: PokemonAPIService(), myPokemon: pokemon[1])
//    }
//}
