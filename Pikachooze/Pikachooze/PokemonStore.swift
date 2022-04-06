import Foundation
import SwiftUI


class PokemonStore: ObservableObject  {
    
    @Published var pokemon: [Pokemon] = []
    @Published var inventoryPokemon : [Pokemon] = []
    
    //@Published var inventoryPokemon: [String]
    
    
    //Sets the var pokemon as the list of our 151 Pokemon (list of 151 Pokemon is given as an input).
    func setPokemon(_ pokemonlist: [Pokemon]) {
        pokemon = pokemonlist
    }
    
    //Updates information for a certain Pokemon. Input: updated Pokemon object. Func takes this object and replaces the old version of this Pokemon with the new one.
    func updatePokemon(_ pokemonUpdate: Pokemon) {
        if let index = pokemon.firstIndex(where: { $0.id == pokemonUpdate.id }) {
            pokemon[index] = pokemonUpdate
        }
        if let pos = inventoryPokemon.firstIndex(where: { $0.id == pokemonUpdate.id }) {
            inventoryPokemon[pos] = pokemonUpdate
        }
    }
    
    //If the player's inventory is not already full (maximum Pokemon in inventory is set to 5) and the given Pokemon is not already in the inventory, then this func adds the given Pokemon to the inventory.
    func addPokemonToInventory(_ pokemonUpdate: Pokemon) -> Bool {
        if inventoryPokemon.count < 5{
            if inventoryPokemon.firstIndex(where: { $0.id == pokemonUpdate.id }) == nil {
                inventoryPokemon.append(pokemonUpdate)
                return true
            }
        }
        return false
    }
    
    //If the given Pokemon is in the player's inventory, this func will remove that Pokemon from the inventory.
    func removePokemonFromInventory(_ pokemonUpdate: Pokemon) {
        if let index = inventoryPokemon.firstIndex(where: { $0.id == pokemonUpdate.id }) {
            inventoryPokemon.remove(at: index)
        }
    }
}


