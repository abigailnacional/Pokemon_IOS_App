//
//  BattleView.swift
//  Pikachooze
//
//  Created by Karina Ng on 3/21/22.
//

import Foundation
import Combine

class BattleView: ObservableObject {
    private var pokeStore: PokemonStore
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var inventoryPokemon: [Pokemon] = []
    @Published var gymLeader: GymLeader
    
    init(_ gymLeader: GymLeader, _ pokeStore: PokemonStore) {
        self.pokeStore = pokeStore
        self.gymLeader = gymLeader
        pokeStore.$inventoryPokemon
            .sink{ [weak self] pokeListPublishedFromStore in
                self?.inventoryPokemon = pokeListPublishedFromStore
            }
            .store(in: &cancellables)
    }
    
    var playerWon: Bool {
        //Iterate through all of gym leader's Pokemon
        //Keep a tally as to who won
        var playerWins: Int = 0
        var glWins: Int = 0
        for glPokeIndex in 0...gymLeader.gymPokemon.count {
            if (gymLeader.gymPokemon[glPokeIndex].id == pokeWon(gymLeader.gymPokemon[glPokeIndex], inventoryPokemon[glPokeIndex]).id){
                //Gym leader won
                glWins = glWins + 1
            } else {
                playerWins = playerWins + 1
            }
        }
        if (playerWins > glWins){
            return true
        } else if (glWins > playerWins){
            return false
        } else {
            //If wins are equal, pick a random winner
            let winner = Int.random(in: 0..<2)
            if (winner == 0){
                return false
            } else {
                return true
            }
        }
    }
    
    func pokeWon(_ pokeOne: Pokemon, _ pokeTwo: Pokemon) -> Pokemon {
        //Find out if the first one is weak to one of the types of the second one, if so, the second one wins
        //Iterate through all types of the second pokemon
        for pokeType in pokeTwo.types {
            //Iterate through all weaknesses of the first pokemon
            for pokeWeak in pokeOne.weaknesses {
                if (pokeWeak == pokeType){
                    return pokeTwo
                } //Else, continue
            }
        }
        //If the first pokemon wasn't weak to the second, check if the second is weak to the first
        for pokeType in pokeOne.types {
            //Iterate through all weaknesses of the first pokemon
            for pokeWeak in pokeTwo.weaknesses {
                if (pokeWeak == pokeType){
                    return pokeOne
                } //Else, continue
            }
        }
        //If neither of them are weak to each other, check if Pokemon 1 is resistant to Pokemon 2
        for pokeType in pokeTwo.types {
            //Iterate through all type in resistant array of the first pokemon
            for pokeRes in pokeOne.resistant {
                if (pokeRes == pokeType){
                    return pokeOne
                } //Else, continue
            }
        }
        //If Pokemon 1 isn't resistant to Pokemon 2, check if 2 is resistant to 1
        for pokeType in pokeOne.types {
            //Iterate through all type in resistant array of the first pokemon
            for pokeRes in pokeTwo.resistant {
                if (pokeRes == pokeType){
                    return pokeTwo
                } //Else, continue
            }
        }
        //If neither pokemon is weak or resistant to the other, just pick a random winner
        let winner = Int.random(in: 0..<2)
        if (winner == 0){
            return pokeOne
        } else {
            return pokeTwo
        }
    }
    
}
