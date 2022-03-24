import Foundation
import SwiftUI


class PokemonStore: ObservableObject  {
    
    @Published var pokemon: [Pokemon] = []
    @Published var inventoryPokemon : [Pokemon] = []
    
    func setPokemon(_ pokemonlist: [Pokemon]) {
        pokemon = pokemonlist
    }
    
    func updatePokemon(_ pokemonUpdate: Pokemon) {
        if let index = pokemon.firstIndex(where: { $0.id == pokemonUpdate.id }) {
            pokemon[index] = pokemonUpdate
        }
    }
    
    func addPokemonToInventory(_ pokemonUpdate: Pokemon) -> Bool {
        if inventoryPokemon.count < 5{
            if inventoryPokemon.firstIndex(where: { $0.id == pokemonUpdate.id }) == nil {
                inventoryPokemon.append(pokemonUpdate)
                return true
            }
        }
        return false
    }
    
    func removePokemonFromInventory(_ pokemonUpdate: Pokemon) {
        if let index = inventoryPokemon.firstIndex(where: { $0.id == pokemonUpdate.id }) {
            inventoryPokemon.remove(at: index)
        }
    }
    
    
}


