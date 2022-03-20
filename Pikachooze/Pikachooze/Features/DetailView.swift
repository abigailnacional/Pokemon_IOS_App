import Foundation
import Combine

class DetailView: ObservableObject {
    let apiService: PokemonAPIService
    
    @Published var pokemon: Pokemon
    
    init(apiService: PokemonAPIService, pokemon: Pokemon){
        self.apiService = apiService
        self.pokemon = pokemon
    }
}
