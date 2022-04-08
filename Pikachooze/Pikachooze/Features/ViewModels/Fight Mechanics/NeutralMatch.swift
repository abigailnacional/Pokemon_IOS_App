//
//  NeutralMatch.swift
//  Pikachooze
//
//  Created by Abby Nacional on 3/30/22.
//
// This extension of FightView comtains maximum matching functions for neutral matches. Used on the all the unmatched gym leader and player Pokemon after advantageous matches are made.

import Foundation
import Combine

extension FightView {
    func maxMatchLeftover(_ unmPlayPoke: [Pokemon], _ umnGlPoke: [Pokemon]) -> Int {
        //Initialize match count
        var matchCount = 0
        //For all gym leader Pokemon
        for g in 0..<umnGlPoke.count {
            //Clear visited because we haven't looked at any player Pokemon for this gym Pokemon yet; it's ok to use visited again even though it's longer than what we need
            clearVisited()
            if (bipartiteMatchNeutral(g, unmPlayPoke)){
                matchCount = matchCount + 1
            }
        }
        return matchCount
    }
    
    // Inputs: starting node (gym leader Pokemon)
    // Output: Boolean value as to whether a neutral match (according to the player) can be found for this gym leader's Pokemon.
    // Function determines if there is a bipartite match for the starting node.
    func bipartiteMatchNeutral(_ glPokeIndex: Int, _ unmatchedPlayPoke: [Pokemon]) -> Bool {
        // For all available player Pokemon
        for playPokeIndex in 0..<unmatchedPlayPoke.count {
            //When we have not yet visited this player's specific Pokemon and there is a neutral match between this gym leader's Pokemon and this player's Pokemon
            if ((classifiedEdges[glPokeIndex][playPokeIndex] == 0) && !visited[playPokeIndex]){
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
