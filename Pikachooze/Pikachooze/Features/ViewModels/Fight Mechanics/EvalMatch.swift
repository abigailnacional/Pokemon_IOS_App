//
//  EvalMatch.swift
//  Pikachooze
//
//  Created by student on 3/29/22.
//
// This extension of FightView contains the array with evaluations of all potential matchups.

import Foundation
import Combine

extension FightView {
    // 2d int array with evaluations of all potential Pokemon matchups in terms of whether they are advantageous for the player or not.
    // For the returned array arr[i][j], where i is one of the Gym Leader's Pokemon and j is one of the Player's Pokemon, the matchup between i and j will have one of the following values:
    // arr[i][j] = 1 if the player will win
    // arr[i][j] = 0 if the player and gym leader are equally likely to win
    // arr[i][j] = -1 if the player will lose
    var classifiedEdges: [[Int]] {
        //Make return array
        var advantEdges: [[Int]] = []
        //Fill array with 0s
        // x is the index for the Gym Leader's Pokemon, y is the index for the player's Pokemon
        for x in 0..<gymLeader.gymPokemon.count {
            for y in 0..<inventoryPokemon.count {
                advantEdges[x][y] = 0
            }
        }
        
        //Iterate through all of Gym Leader's Pokemon
        for glPokeNum in 0..<gymLeader.gymPokemon.count {
            //Iterate through all of the Pokemon in the Player's inventory
            for playPokeNum in 0..<inventoryPokemon.count {
                //Check if the match is advantageous to the player:
                if let determineWin = absoluteWin(gymLeader.gymPokemon[glPokeNum], inventoryPokemon[playPokeNum]) {
                    // The two Pokemon did not tie, so if the player won, put the value 1 in the 2d array.
                    if inventoryPokemon[playPokeNum].id == determineWin.id {
                        advantEdges[glPokeNum][playPokeNum] = 1
                    } else {
                        // The player lost; put the value -1 in the array.
                        advantEdges[glPokeNum][playPokeNum] = -1
                    }
                } else {
                    // The Pokemon tied, so put the value 0 in the array.
                    advantEdges[glPokeNum][playPokeNum] = 0
                }
            }
        }
        return advantEdges
    }
}
