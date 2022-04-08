//
//  Suggested.swift
//  Pikachooze
//
//  Created by Abby Nacional on 3/29/22.
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
            
            print("Unmatched Player Pokemon : \(unmatchedPlay)")
            print("Unmatched Gym Leader Pokemon : \(unmatchedGl)")
            print("neutralMatch: \(neutralMatch)")
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
                //Iterate through all unmatched gym leader Pokemon
                for pokeNum in 0..<unmatchedGl2.count {
                    //Find the actual index of the gym leader Pokemon
                    if let realGlIndex = glToUnmatched.firstIndex(where: {$0 == pokeNum}) {
                        //Match the first unmatched player Pokemon with the first unmatched gym leader Pokemon
                        suggest[realGlIndex] = unmatchedPlay2[pokeNum]
                        //Update assign since we haven't used the function that usually updates it
                        if let realPlayIndex = invToUnmatched.firstIndex(where: {$0 == pokeNum}) {
                            assign[realPlayIndex] = realGlIndex
                        }
                    }
                }
            }
        }
        //If there were more Pokemon in the inventory than gym leader Pokemon, tack the extras onto the end
        if (inventoryPokemon.count > gymLeader.gymPokemon.count){
            //Get all the inventory Pokemon that didn't get matched
            let unmatchedPlay3: [Pokemon] = noMatchPlayPoke()
            print("Unmatched Player Pokemon (Last) : \(unmatchedPlay3)")
            //Attach them to the end of suggest
            var extraPokeIndex = gymLeader.gymPokemon.count
            for unm3 in unmatchedPlay3 {
                suggest[extraPokeIndex] = unm3
                extraPokeIndex += 1
            }
        }
        print("Final Suggest: \(suggest)")
        return suggest
    }
}
