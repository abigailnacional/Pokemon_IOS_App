//
//  BattleView.swift
//  Pikachooze
//
//  Created by Karina Ng on 3/21/22.
//

import Foundation
import Combine

final class BattleView: ObservableObject {
    
    let pokeStore: PokemonStore
    let gymLeaders = GymLeader.previewData //list of gymleaders that is from the GymLeader Model
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var inventoryPokemon: [Pokemon] = []

    
    init(pokeStore: PokemonStore) {
        self.pokeStore = pokeStore
        pokeStore.$inventoryPokemon
            .sink{ [weak self] pokeListPublishedFromStore in
                self?.inventoryPokemon = pokeListPublishedFromStore
            }
            .store(in: &cancellables)
    }
    
    
}
