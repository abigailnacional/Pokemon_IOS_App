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
        }.navigationTitle("My Pokemon")
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
            .frame(maxWidth: 70, maxHeight: 90)
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
