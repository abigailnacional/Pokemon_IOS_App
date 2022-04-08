import SwiftUI

struct InventoryScreen: View {
    @EnvironmentObject var pokeStore: PokemonStore
    @StateObject var viewModel: InventoryView
    
    var body: some View {
        List(viewModel.inventoryPokemon) { pokemon in
            NavigationLink(destination: PokemonDetail(viewModel: PokemonDetailView(pokemon, pokeStore))
            ) {
                InventoryRow(pokemon: pokemon)
            }
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        pokeStore.removePokemonFromInventory(pokemon)
                    } label: {
                        Label("Remove", systemImage: "trash")
                    }
                }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("My Pokemon").font(Font.custom("Minecraft", size: 48))
                    .padding(.top, 20)
            }
        }
    }
}


struct InventoryRow: View {
    let pokemon: Pokemon
    
    var body: some View {
        HStack {
            AsyncImage(url: pokemon.image) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(4)
            } placeholder: {
                  Image(systemName: "book.fill")
                }
            .frame(width: 100, height: 100)
                Text(pokemon.nickname ?? pokemon.name)
                .font(Font.custom("Minecraft", size: 15))
        }
    }
}

//struct Inventory_Previews: PreviewProvider {
//    static let pokeStore = PokemonStore()
//    static var previews: some View {
//        InventoryScreen(viewModel: InventoryView(pokeStore: pokeStore))
//    }
//}
