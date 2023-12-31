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
                        print(Text("could not catch 'em all!").font(Font.custom("Minecraft", size: 15)))
                    }
                }
                .environmentObject(pokemonStore)
        }
    }
}
