import Foundation
import Combine

class InventoryView: ObservableObject {
    private var pokeStore: PokemonStore
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var inventoryPokemon: [Pokemon] = []
    
    var filteredInventory: [Pokemon] {
        return inventoryPokemon
    }
    
    init(pokeStore: PokemonStore) {
        self.pokeStore = pokeStore
        pokeStore.$inventoryPokemon
            .sink{ [weak self] pokeListPublishedFromStore in
                self?.inventoryPokemon = pokeListPublishedFromStore
            }
            .store(in: &cancellables)
    }
}
