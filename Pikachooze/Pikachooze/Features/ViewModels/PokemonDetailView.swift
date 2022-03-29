import Foundation
import Combine
import UIKit

class PokemonDetailView: ObservableObject {

    private var pokeStore: PokemonStore
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var inInventoryList: Bool = false
    @Published var pokemon: Pokemon
    @Published var inventoryPokemon: [Pokemon] = []
    
    init(_ pokemon: Pokemon, _ pokeStore: PokemonStore) {
        self.pokemon = pokemon
        self.pokeStore = pokeStore
        pokeStore.$inventoryPokemon
            .sink{ [weak self] pokeListPublishedFromStore in
                self?.inventoryPokemon = pokeListPublishedFromStore
                self?.inInventoryList = pokeListPublishedFromStore.contains(where: { $0.id == pokemon.id })
            }
            .store(in: &cancellables)
    }
    
//    func nicknameSetter() -> String {
//        if case let nicknam == pokemon.nickname {
//            return nicknam
//        } else {
//            
//        }
//    }
    
    func buttonTapped() {
        if inInventoryList == true {
            pokeStore.removePokemonFromInventory(pokemon)
        }
        else {
            if pokeStore.addPokemonToInventory(pokemon) == false {
                
            }
        }
    }
}
