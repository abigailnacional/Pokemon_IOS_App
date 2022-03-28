import Foundation
import Combine

class SearchView: ObservableObject {
    let pokemonStore: PokemonStore
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var pokemon: [Pokemon] = []
    @Published var searchText: String = ""
    
    init(pokemonStore: PokemonStore) {
        self.pokemonStore = pokemonStore
        pokemonStore.$pokemon
            .sink{ [weak self] pokemonPublishedFromStore in
                self?.pokemon = pokemonPublishedFromStore
            }
            .store(in: &cancellables)
    }
    
    var filteredPokemon: [Pokemon] {
        if searchText.isEmpty {
            return pokemon
        } else {
            return pokemon
                .filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    
}

