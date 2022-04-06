import Foundation
import Combine
import UIKit

class PokemonDetailView: ObservableObject {
    
    private var pokeStore: PokemonStore
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var inInventoryList: Bool = false
    @Published var isFull: Bool = false
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
    
    func setNickname(input: String) {
        pokemon.nickname = input
        pokeStore.updatePokemon(Pokemon(id: pokemon.id,
                                        number: pokemon.number,
                                        name: pokemon.name,
                                        nickname: input,
                                        classification: pokemon.classification,
                                        types: pokemon.types,
                                        resistant: pokemon.resistant,
                                        weaknesses: pokemon.weaknesses,
                                        image: pokemon.image))
    }
    
    func buttonTapped() {
        if inInventoryList == true {
            pokeStore.removePokemonFromInventory(pokemon)
        }
        else {
            if pokeStore.addPokemonToInventory(pokemon) == false {
                isFull = true
            }
        }
    }
}
