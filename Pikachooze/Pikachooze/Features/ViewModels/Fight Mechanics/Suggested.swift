//
//  Suggested.swift
//  Pikachooze
//
//  Created by student on 3/29/22.
//
// This part of FightView holds the suggested line-up of Pokemon for the player, based on which gym leader they are battling and which Pokemon are in the player's inventory.

import Foundation
import Combine

extension FightView {
    var suggestedOrder: [Pokemon] {
        //Make a return array for the suggested Pokemon order.
        var suggest: [Pokemon] = []
        
        //Make a maximum matching with only advantageous edges.
        let advantMatch: Int = maxMatch()
        //Check if all of the gym leader pokemon are matched.
        if (advantMatch == gymLeader.gymPokemon.count){
            //All the Pokemon matched, so use the assigned values as the suggested Pokemon matches
            // For every gym leader Pokemon
            for s in 0..<gymLeader.gymPokemon.count {
                // Match the player Pokemon to the gym leader Pokemon
                if let playerPokemon = assign.firstIndex(where: {$0 == s}){
                    suggest[s] = inventoryPokemon[playerPokemon]
                }
            }
        } else {
            //Else, all of the gym leader Pokemon didn't get a match.
            //Get all unmatched player Pokemon
            let unmatchedPlay: [Pokemon] = noMatchPlayPoke()
            //Get all unmatched gym leader Pokemon
            let unmatchedGl: [Pokemon] = noMatchGymPoke()
            //Find matchings using neutral relationships
            let neutralMatch: Int = maxMatchLeftover(unmatchedPlay, unmatchedGl)
            if ((neutralMatch + advantMatch) == gymLeader.gymPokemon.count){
                //All the Pokemon matched, so use the assigned values as the suggested Pokemon matches
                // For every gym leader Pokemon
                for s in 0..<gymLeader.gymPokemon.count {
                    // Match the player Pokemon to the gym leader Pokemon
                    if let playerPokemon = assign.firstIndex(where: {$0 == s}){
                        suggest[s] = inventoryPokemon[playerPokemon]
                    }
                }
            } else {
                //Else, all of the gym leader Pokemon didn't get a match.
                //Get all unmatched player Pokemon
                let unmatchedPlay2: [Pokemon] = noMatchPlayPoke()
                //Get all unmatched gym leader Pokemon
                let unmatchedGl2: [Pokemon] = noMatchGymPoke()
                //Match them up
                for pokeNum in 0..<unmatchedGl2.count {
                    suggest[pokeNum] = unmatchedPlay2[pokeNum]
                }
            }
        }
        return suggest
    }
}
