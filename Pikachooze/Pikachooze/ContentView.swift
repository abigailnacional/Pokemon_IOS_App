import SwiftUI

struct ContentView: View {
    var pokemonStore = PokemonStore(apiService: PokemonAPIService())
    var body: some View {
        Text("Hello, world!")
            .padding()
            .task{await pokemonStore.getPokemon()}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
