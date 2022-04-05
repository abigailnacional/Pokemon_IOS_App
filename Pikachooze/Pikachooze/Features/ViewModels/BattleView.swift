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
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var inventoryPokemon: [Pokemon] = []
    
    init(_ pokeStore: PokemonStore) {
        self.pokeStore = pokeStore
        pokeStore.$inventoryPokemon
            .sink{ [weak self] pokeListPublishedFromStore in
                self?.inventoryPokemon = pokeListPublishedFromStore
            }
            .store(in: &cancellables)
    }
    
}
