import SwiftUI

@main
struct PikachoozeApp: App {
    @StateObject var pokemonStore = PokemonStore()
    let apiService = PokemonAPIService()

    var body: some Scene {
        WindowGroup {
            TabContainer()
                .task{
                    if let pokemon = try? await apiService.fetchPokemons(number: 151) {
                        pokemonStore.setPokemon(pokemon)
                    } else{
                        print("could not catch em all!")
                    }
                }
                .environmentObject(pokemonStore)
        }
    }
}
