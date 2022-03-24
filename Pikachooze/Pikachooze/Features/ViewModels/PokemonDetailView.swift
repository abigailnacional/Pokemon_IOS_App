import Foundation
import Combine

enum LoadingState {
    case notAvailable
    case loading
    case success(data: Pokemon)
    case failed(error: Error)
}

@MainActor
class PokemonDetailView: ObservableObject {
    let apiService: PokemonAPIService
    
    @Published private(set) var state: LoadingState = .notAvailable
    private var pokeStore: PokemonStore
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var inInventoryList: Bool = false
    @Published var hasAPIError: Bool = false
    @Published var pokemon: Pokemon
    @Published var inventoryPokemon: [Pokemon] = []
    
    init(apiService: PokemonAPIService, pokemon: Pokemon, pokeStore: PokemonStore) {
        self.apiService = apiService
        self.pokemon = pokemon
        self.pokeStore = pokeStore
        pokeStore.$inventoryPokemon
            .sink{ [weak self] pokeListPublishedFromStore in
                self?.inventoryPokemon = pokeListPublishedFromStore
                self?.inInventoryList = pokeListPublishedFromStore.contains(where: { $0.id == pokemon.id })
            }
            .store(in: &cancellables)
    }
    
    func buttonLabel() -> String {
        if inInventoryList == true {
            return "Remove"
        }
        return "Add"
    }
    
    func buttonTapped() {
        if inInventoryList == true {
            pokeStore.removePokemonFromInventory(pokemon)
        }
        else {
            pokeStore.addPokemonToInventory(pokemon)
        }
    }
}
