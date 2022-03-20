import SwiftUI

@main
struct PikachoozeApp: App {
    
    var body: some Scene {
        WindowGroup {
            SearchList(viewModel: SearchView(apiService: PokemonAPIService()))
        }
    }
}
