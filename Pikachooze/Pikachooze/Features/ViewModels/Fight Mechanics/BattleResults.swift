//
//  BattleResults.swift
//  Pikachooze
//
//  Created by Abby Nacional on 3/29/22.
//
// This part of FightView holds the function that determines the winner of the overall battle.

import Foundation
import Combine

extension FightView {
    // playerWon is a boolean value that indicates whether the player won the battle against the Gym Leader.
    var playerWon: Bool {
        //Iterate through all of the gym leader's Pokemon
        //Keep a tally as to who won
        var playerWins: Int = 0
        var glWins: Int = 0
        var userPokemon : [Pokemon] { //handles the logic with the suggested pokemon vs non suggested pokemon
            if (usingSuggested){
                return suggestedOrder
            } else{
                return inventoryPokemon
            }
        }
        for glPokeIndex in 0..<gymLeader.gymPokemon.count {
            if (gymLeader.gymPokemon[glPokeIndex].id == pokeWon(gymLeader.gymPokemon[glPokeIndex], userPokemon[glPokeIndex]).id){ //problem with differing lengths of pokemon
                //Gym leader won, add to their wins
                glWins = glWins + 1
            } else {
                //Player won, add to their wins
                playerWins = playerWins + 1
            }
        }
        //Whomever won more individual fights wins the overall battle.
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
}
