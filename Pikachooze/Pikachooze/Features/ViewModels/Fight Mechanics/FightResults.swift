//
//  FightResults.swift
//  Pikachooze
//
//  Created by Abby Nacional on 3/29/22.
//
// This part of FightView holds the functions that determine individual fight winners.

import Foundation
import Combine

extension FightView {
    // Determines which of two Pokemon will win. Returns nil if there is a tie.
    // We need absoluteWin as a separate function from pokeWon because the suggestion algorithm requires a clear ranking of Pokemon superiority with no randomness due to ties.
    func absoluteWin(_ pokeOne: Pokemon, _ pokeTwo: Pokemon) -> Pokemon? {
        //This algorithm favors pokeTwo in the case that both Pokemon are weak to each other, but favors pokeOne in the case that both Pokemon are resistant to each other.
        
        for pokeType in pokeTwo.types {
            //If pokeOne is weak to pokeTwo, pokeTwo wins
            if (pokeOne.weaknesses.contains(pokeType)){
                return pokeTwo
            }
        }
        //If the first pokemon wasn't weak to the second, check if the second is weak to the first
        for pokeType in pokeOne.types {
            //If pokeTwo is weak to pokeOne, pokeOne wins
            if (pokeTwo.weaknesses.contains(pokeType)){
                return pokeOne
            }
        }
        //If neither of them are weak to each other, check if Pokemon 1 is resistant to Pokemon 2
        for pokeType in pokeTwo.types {
            if (pokeOne.resistant.contains(pokeType)){
                return pokeOne
            }
        }
        //If Pokemon 1 isn't resistant to Pokemon 2, check if 2 is resistant to 1
        for pokeType in pokeOne.types {
            //If pokeTwo is resistant to pokeOne, pokeTwo wins
            if (pokeTwo.resistant.contains(pokeType)) {
                return pokeTwo
            }
        }
        return nil
    }
    
    // pokeWon takes two Pokemon as input and outputs the winner of a fight between those two Pokemon. Outputs a random winner if there is a tie.
    func pokeWon(_ pokeOne: Pokemon, _ pokeTwo: Pokemon) -> Pokemon {
        //Use absoluteWin to find an absolute winner
        if let absoluteWinner = absoluteWin(pokeOne, pokeTwo) {
            return absoluteWinner
        } else {
            //If neither pokemon is weak or resistant to the other, just pick a random winner
            let winner = Int.random(in: 0..<2)
            if (winner == 0){
                return pokeOne
            } else {
                return pokeTwo
            }
        }
    }
}
