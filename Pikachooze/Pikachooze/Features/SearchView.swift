import Foundation
import Combine

class SearchView: ObservableObject {
    let apiService: PokemonAPIService
    
    @Published var pokemon: [Pokemon] = []
    @Published var searchText: String = ""
    
    var filteredPokemon: [Pokemon] {
      if searchText.isEmpty {
        return pokemon
      } else {
        return pokemon
          .filter { $0.name.lowercased().contains(searchText.lowercased()) }
      }
    }
    
    init(apiService: PokemonAPIService){
        self.apiService = apiService
    }
}
