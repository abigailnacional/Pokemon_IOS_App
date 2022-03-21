import Foundation
import Combine
import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: SearchView
    
    var body: some View {
        Text("Welcome back, __name__")
        Text("Your top 3")
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
