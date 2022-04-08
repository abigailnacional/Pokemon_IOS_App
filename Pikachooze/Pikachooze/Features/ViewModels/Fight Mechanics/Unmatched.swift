//
//  Unmatched.swift
//  Pikachooze
//
//  Created by Abby Nacional on 3/31/22.
//
// Finds the unmatched Pokemon for the suggest function.

import Foundation
import Combine

extension FightView {
    func noMatchPlayPoke() -> [Pokemon] {
        var ret: [Pokemon] = []
        clearInvToUnm()
        //Find all player Pokemon who don't yet have a match
        for i in 0..<inventoryPokemon.count {
            if (assign[i] == -1){
                //Add this Pokemon to the list of unmatched player Pokemon
                ret.append(inventoryPokemon[i])
                //Add these indices to invToUnmatched to keep track
                invToUnmatched.insert((ret.count - 1), at: i)
            }
        }
        return ret
    }
    
    func noMatchGymPoke() -> [Pokemon] {
        var ret: [Pokemon] = []
        clearGlToUnm()
        //Find all gym leaderPokemon who don't yet have a match
        for i in 0..<gymLeader.gymPokemon.count {
            if (!assign.contains(i)){
                //Add this Pokemon to the list of unmatched gym leader Pokemon
                ret.append(gymLeader.gymPokemon[i])
                //Add these indices to invToUnmatched to keep track
                glToUnmatched.insert((ret.count - 1), at: i)
            }
        }
        return ret
    }
}
