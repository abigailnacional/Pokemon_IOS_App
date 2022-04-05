import Foundation
import Combine
import UIKit

class BattleDetailView: ObservableObject {

    @Published var gymLeader: GymLeader
    @Published var gymLeaderPokemon : [Pokemon]
   
    init(gymLeader: GymLeader) {
        self.gymLeader = gymLeader
        self.gymLeaderPokemon = gymLeader.gymPokemon
    }
    

    
}

