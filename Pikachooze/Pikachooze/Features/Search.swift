
import SwiftUI

struct Search: View {
    @StateObject var viewModel: SearchView
    @StateObject var viewM: PokemonDetailView
    
    var body: some View {
        NavigationView{
            List(viewModel.filteredPokemon) { pokemon in
                NavigationLink(destination:
                                PokeScreen(viewModel: viewM)
                ) {
                    SearchRow(pokemon: pokemon)
                }
            }
            .searchable(text: $viewModel.searchText)
        }
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
            Text(pokemon.name)
        }
    }
}

//struct Search_Previews: PreviewProvider {
//    static var previews: some View {
//        Search(viewModel: SearchView(apiService: PokemonAPIService()), viewM: PokemonDetailView(apiService: PokemonAPIService(), myPokemon: pokemon[1])
//    }
//}
