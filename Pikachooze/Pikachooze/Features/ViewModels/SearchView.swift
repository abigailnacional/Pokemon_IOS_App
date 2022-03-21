import Foundation
import Combine

enum LoadingState{
    case notAvailable
    case loading
    case success
    case failed(error: Error)
}

class SearchView: ObservableObject {
    let apiService: PokemonAPIService
    
    @Published var pokemon: [Pokemon] = []
    @Published private(set) var state: LoadingState = .notAvailable
    @Published var hasAPIError: Bool = false
    @Published var searchText: String = ""
    
    init(apiService: PokemonAPIService){
        self.apiService = apiService
    }
    
    var filteredPokemon: [Pokemon] {
      if searchText.isEmpty {
        return pokemon
      } else {
        return pokemon
          .filter { $0.name.lowercased().contains(searchText.lowercased()) }
      }
    }
    
    
    func getPokemon() async {
      self.state = .loading
      do {
        let pokemon = try await apiService.fetch(number: 1)
        self.state = .success
        self.pokemon = pokemon
      } catch {
        self.state = .failed(error: error)
        self.hasAPIError = true
      }
    }
}

