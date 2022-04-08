//
//  GoodMatch.swift
//  Pikachooze
//
//  Created by Abby Nacional on 3/29/22.
//
// This extension of FightView contains maximum matching functions for advantageous matches.

import Foundation
import Combine

extension FightView {
    func maxMatch() -> Int {
        //Initialize match count
        var matchCount = 0
        //For all gym leader Pokemon
        for g in 0..<gymLeader.gymPokemon.count {
            //Clear visited because we haven't looked at any player Pokemon for this gym Pokemon yet
            clearVisited()
            if (bipartiteMatch(g)){
                matchCount = matchCount + 1
            }
        }
        return matchCount
    }
    
    // Inputs: starting node (gym leader Pokemon)
    // Output: Boolean value as to whether an advantageous match (according to the player) can be found for this gym leader's Pokemon.
    // Function determines if there is a bipartite match for the starting node.
    func bipartiteMatch(_ glPokeIndex: Int) -> Bool {
        // For all player Pokemon
        for playPokeIndex in 0..<inventoryPokemon.count {
            //When we have not yet visited this player's specific Pokemon and there is an advantageous match between this gym leader's Pokemon and this player's Pokemon
            if ((classifiedEdges[glPokeIndex][playPokeIndex] == 1) && !visited[playPokeIndex]){
                //Mark this player Pokemon as visited
                visited[playPokeIndex] = true
                //If the player Pokemon isn't assigned to a gym leader Pokemon
                if (assign[playPokeIndex] < 0) {
                    //Assign this player Pokemon to this gym leader Pokemon
                    assign[playPokeIndex] = glPokeIndex
                    //We found a match, so return true
                    return true
                }
            }
        }
        //If you didn't find a single match, return false
        return false
    }
}
