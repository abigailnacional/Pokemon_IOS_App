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
    func suggestedOrder() -> [Pokemon] {
        //Make a return array for the suggested Pokemon order.
        var suggest: [Pokemon] = []
        for i in inventoryPokemon {
            suggest.append(i)
        }
        
        //Make a maximum matching with only advantageous edges.
        let advantMatch: Int = maxMatch()
        print("Suggest Pokemon 1: \(suggest)")
        print("advantMatch: \(advantMatch)")
        //Check if all of the gym leader pokemon are matched.
        if (advantMatch > 0){
            //Some Pokemon matched, so use the assigned values as the suggested Pokemon matches
            // For every gym leader Pokemon
            for s in 0..<gymLeader.gymPokemon.count {
                // Match the player Pokemon to the gym leader Pokemon
                if let playerPokemon = assign.firstIndex(where: {$0 == s}){
                    suggest[s] = inventoryPokemon[playerPokemon]
                }
            }
        }
        //Not everyone matched, so keep going
        if (advantMatch != gymLeader.gymPokemon.count) {
            //Else, all of the gym leader Pokemon didn't get a match.
            //Get all unmatched player Pokemon
            let unmatchedPlay: [Pokemon] = noMatchPlayPoke()
            //Get all unmatched gym leader Pokemon
            let unmatchedGl: [Pokemon] = noMatchGymPoke()
            //Find matchings using neutral relationships
            let neutralMatch: Int = maxMatchLeftover(unmatchedPlay, unmatchedGl)
            if (neutralMatch > 0){
                //Some Pokemon matched, so use the assigned values as the suggested Pokemon matches
                // For every gym leader Pokemon
                for s in 0..<gymLeader.gymPokemon.count {
                    // Match the player Pokemon to the gym leader Pokemon
                    if let playerPokemon = assign.firstIndex(where: {$0 == s}){
                        suggest[s] = inventoryPokemon[playerPokemon]
                    }
                }
            }
            //Not everyone matched, so keep going
            if ((neutralMatch + advantMatch) != gymLeader.gymPokemon.count) {
                //Else, all of the gym leader Pokemon didn't get a match.
                //Get all unmatched player Pokemon
                let unmatchedPlay2: [Pokemon] = noMatchPlayPoke()
                //Get all unmatched gym leader Pokemon
                let unmatchedGl2: [Pokemon] = noMatchGymPoke()
                //Match them up
                print("Suggest Pokemon in else: \(suggest)")
                print("Unmatched Player Pokemon : \(unmatchedPlay2)")
                print("Unmatched Gym Leader Pokemon : \(unmatchedGl2)")
                print("glToUnmatched : \(glToUnmatched)")
                for pokeNum in 0..<unmatchedGl2.count {
                    if let realGlIndex = glToUnmatched.firstIndex(where: {$0 == pokeNum}) {
                        suggest[realGlIndex] = unmatchedPlay2[pokeNum]
                    }
                }
            }
        }
        print("Final Suggest: \(suggest)")
        return suggest
    }
}
