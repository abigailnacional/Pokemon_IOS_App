//
//  FightView.swift
//  Pikachooze
//
//  Created by student on 4/4/22.
//

import Foundation
import Combine

// NOTES TO THE FightView DEVELOPER:
// The only variables you need to worry about are the following:

//What you need to provide:
// The gymLeader and pokeStore

//Values that you can use (please ignore everything else):

// 1) playerWon: Bool
//  This variable tells you whether the player won the battle against the gym leader or not.

// 2) suggestedOrder: [Pokemon]
//  This variable holds the Pokemon from the player's inventory in the optimal order for success. They are ordered so that they correspond to their gym leader Pokemon opponent by index: for example, the first listed Pokemon for the gym leader in PreviewData will fight suggestedOrder[0].

class FightView: ObservableObject {
    private var pokeStore: PokemonStore
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var inventoryPokemon: [Pokemon] = []
    //You must specify which Gym Leader the player is going to battle.
    @Published var gymLeader: GymLeader
    @Published var pokemon: Pokemon
    
    init(_ gymLeader: GymLeader, _ pokeStore: PokemonStore, _ pokemon: Pokemon) {
        self.pokeStore = pokeStore
        self.gymLeader = gymLeader
        self.pokemon = pokemon
        pokeStore.$inventoryPokemon
            .sink{ [weak self] pokeListPublishedFromStore in
                self?.inventoryPokemon = pokeListPublishedFromStore
            }
            .store(in: &cancellables)
    }
    
    //List to keep track of player Pokemon that we have looked at
    //Initialized to false because we start out not having looked at anything yet
    //There are always 5 Pokemon in the inventory, and we can't use inventory.count here, so count is hard coded to be 5
    var visited = [Bool](repeating: false, count: 5)
    //Resets visited to all false
    func clearVisited(){
        visited = [Bool](repeating: false, count: 5)
    }
     
    //List to keep track of player Pokemon that already have a match
    //Initialized to -1 because all playerPokemon start out available
    var assign = [Int](repeating: -1, count: 5)
    
    //In case there are unmatched player Pokemon, use this array to keep track of their index in the inventory array.
    //Indices for invToUnmatched are the inventory index of the Pokemon.
    //Values for invToUnmatched is the unmatched array index of the Pokemon.
    var invToUnmatched: [Int] = []
    
    //In case there are unmatched gym leader Pokemon, use this array to keep track of their index in the gymLeader.gymPokemon array.
    //Indices for glToUnmatched are the gymLeader.gymPokemon index of the Pokemon.
    //Values for glToUnmatched is the unmatched array index of the Pokemon.
    var glToUnmatched: [Int] = []
}
