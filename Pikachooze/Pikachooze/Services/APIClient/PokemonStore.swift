import Foundation
import SwiftUI

class PokemonStore: ObservableObject  {
    let apiService: PokemonAPIService
   @Published var pokemon: [Pokemon] = []
  
    init(apiService: PokemonAPIService) {
        self.apiService = apiService
    }
    
    func getPokemon() async {
        do {
            pokemon = try await apiService.fetch(number: 151)
        } catch{
            
        }
    }
    
}

 
