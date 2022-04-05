//
//  Fight.swift
//  Pikachooze
//
//  Created by Ju Young Yang on 3/31/22.
//

import SwiftUI

struct Fight: View {
    @StateObject var viewModel: BattleDetailView
    @EnvironmentObject var pokeStore: PokemonStore


    var body: some View {
        HStack{
            List(viewModel.gymLeaderPokemon) { gympokemon in
                Text(gympokemon.name)
            }
            PlayerFight(viewModel: InventoryView(pokeStore: pokeStore))
        }
    }
}


struct PlayerFight: View {
    @StateObject var viewModel: InventoryView
    
    var body: some View {
        List(viewModel.inventoryPokemon) { inventpokemon in
            Text(inventpokemon.name)
        }
    }
}


//struct Fight_Previews: PreviewProvider {
//    static var previews: some View {
//        Fight()
//    }
//}
