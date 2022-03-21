import Foundation
import Combine
import SwiftUI

struct BattleView: View {
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
