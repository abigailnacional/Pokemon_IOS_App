
import SwiftUI

struct Search: View {
    @StateObject var viewModel: SearchView
    
    var body: some View {
        List(viewModel.filteredPokemon) { pokemon in
            NavigationLink(destination: PokemonDetail(viewModel: PokemonDetailView(pokemon, viewModel.pokemonStore))
            ) {
                SearchRow(pokemon: pokemon)
            }
        }
        .searchable(text: $viewModel.searchText)
        .disableAutocorrection(true)
        .navigationTitle("Choose Your Pokemon!")
    }
}


struct SearchRow: View {
    let pokemon: Pokemon
    
    var body: some View {
        HStack{
            AsyncImage(url: pokemon.image){
                image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: "circle")
            }
            .frame(maxWidth: 100, maxHeight: 100)
            Text(pokemon.name).font(Font.custom("Minecraft", size: 15))
        }
    }
}

//struct Search_Previews: PreviewProvider {
//    static var previews: some View {
//        Search(viewModel: SearchView(apiService: PokemonAPIService()), viewM: PokemonDetailView(apiService: PokemonAPIService(), myPokemon: pokemon[1])
//    }
//}
