import Foundation
import Combine
import UIKit

class BattleDetailView: ObservableObject {

    @Published var gymLeader: GymLeader
    @Published var gymLeaderPokemon : [Pokemon]
    @Published var hasEnough: Bool = false
    let pokeStore: PokemonStore
    private var cancellables: Set<AnyCancellable> = []
   
    init(_ gymLeader: GymLeader, _ pokeStore: PokemonStore) {
        self.gymLeader = gymLeader
        self.pokeStore = pokeStore
        self.gymLeaderPokemon = gymLeader.gymPokemon
        pokeStore.$inventoryPokemon
            .sink{ [weak self] pokeListPublishedFromStore in
                if (pokeListPublishedFromStore.count >= gymLeader.gymPokemon.count){
                    self?.hasEnough = true
                }
            }
            .store(in: &cancellables)
    }
}



