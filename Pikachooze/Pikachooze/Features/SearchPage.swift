import Foundation
import SwiftUI

struct SearchList: View {
    @ObservedObject var viewModel: SearchView
    
    var body: some View {
        NavigationView {
            List(viewModel.filteredPokemon){pokemon in
                NavigationLink(destination:
                                PokemonDetail(viewModel: DetailView(apiService: PokemonAPIService(), pokemon: pokemon))){
                    SearchRow(pokemon: pokemon)
                }
            }
            .searchable(text: $viewModel.searchText)
        }
    }
}

struct SearchRow: View {
    let pokemon: Pokemon
    
    var body: some View {
        HStack {
            
        }
    }
}
