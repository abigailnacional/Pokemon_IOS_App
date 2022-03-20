import Foundation
import SwiftUI

struct SearchList: View {
    @ObservedObject var viewModel: SearchView
    
    var body: some View {
        List(viewModel.filteredPokemon){
            pokemon in
            SearchRow(pokemon: pokemon)
        }.searchable(text: $viewModel.searchText)
            .navigationTitle("Search Pokemon")
        /*
        NavigationView {
            List(viewModel.filteredPokemon){pokemon in
                NavigationLink(destination:
                                PokemonDetail(viewModel: DetailView(apiService: PokemonAPIService(), pokemon: pokemon))){
                    SearchRow(pokemon: pokemon)
                }
            }
            .searchable(text: $viewModel.searchText)
        }*/
    }
}

struct SearchRow: View {
    let pokemon: Pokemon
    
    var body: some View {
        HStack {
            AsyncImage(url: pokemon.image){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                if pokemon.image != nil {
                    ProgressView()
            }
                else {
                    Image(systemName: "x.circle.fill")
                }
            }
            .frame(maxWidth: 100, maxHeight: 100)
            Text(pokemon.name)
        }
    }
}

struct SearchList_Previews: PreviewProvider {
    static var previews: some View {
        SearchList(viewModel: SearchView(apiService: PokemonAPIService()))
    }
}
