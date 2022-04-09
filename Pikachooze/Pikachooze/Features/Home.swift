
import SwiftUI

extension Color {
    static let grey = Color(red: 232 / 255, green: 232 / 255, blue: 232 / 255)
}

struct Home: View {
    @StateObject var viewModel: HomeView
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text("Welcome back, Professor Phillips!").font(Font.custom("Minecraft", size: 15))
                    .padding(15)
                    .background(Color.grey)
                    .cornerRadius(30)
                Image("profile photo")
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                VStack{
                    if viewModel.inventoryPokemon.count > 0 {
                        Text("Your Top 3")
                            .font(Font.custom("Minecraft", size: 15))
                    }
                    
                    ForEach((viewModel.inventoryPokemon), id: \.self) { pokemon in
                        HomeRow(pokemon: pokemon)
                    }
                }
            }
        }
    }
}

struct HomeRow: View {
    let pokemon: Pokemon
    
    var body: some View {
        HStack {
            AsyncImage(url: pokemon.image) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(4)
            } placeholder: {
                  Image(systemName: "circle.fill")
                }
            .frame(width: 100, height: 100)
            Text(pokemon.nickname ?? pokemon.name)
                .font(Font.custom("Minecraft", size: 15))
        }
    }
}

