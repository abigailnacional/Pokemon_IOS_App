//
//  BattlesDetail.swift
//  Pikachooze
//
//  Created by Ju Young Yang on 3/29/22.
//

import SwiftUI


struct BattlesDetail: View {
    @StateObject var viewModel: BattleDetailView
    @State var isActive = false
    @State var showAlert = false
    
    var body: some View {
        ScrollView{
            VStack(alignment: .center){
                VStack {
                    leaderImage
                    Text(viewModel.gymLeader.name)
                        .font(Font.custom("Minecraft", size: 35))
                }
                .foregroundColor(Color.gray)
                .padding(10)
                .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 5)
                        )
                Text("Location: \(viewModel.gymLeader.city)")
                    .font(Font.custom("Minecraft", size: 20))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.leading, 25)
                    .padding(.top, 10)
                    .padding(.bottom, 15)
                NavigationLink(destination: Fight(viewModel: FightView(viewModel.gymLeader, viewModel.pokeStore)), isActive: $isActive) {
                    Button (action:{
                        if (!viewModel.isEmpty){
                            isActive = true
                        } else{
                            showAlert = true
                        }
                    }){
                    Text("Fight!")
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                        .font(Font.custom("Minecraft", size: 25))
                        .frame(width: 200, height: 30, alignment: .center)
                        .foregroundColor(Color.white)
                        .background(Color.red)
                        .cornerRadius(25)
                        .overlay(RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.red, lineWidth: 5))
                    }
                    
                }.alert("Oh no! Your inventory is Empty :(", isPresented: $showAlert ) {
                    Button("OK", role: .cancel) { }
                }
                Text("\(viewModel.gymLeader.name)'s Pokemon")
                    .font(Font.custom("Minecraft", size: 25))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.leading, 25)
                    .padding(.top, 10)
                    .padding(.bottom, 15)
                ForEach(viewModel.gymLeaderPokemon, id:\.self){
                    PokemonRow(pokemon: $0)
                }
            }
        }
    }
    
    var leaderImage: some View {
        AsyncImage(url:viewModel.gymLeader.image) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
                ProgressView()
        }
        .frame(maxWidth: 200, maxHeight: 200)
    }
    
    var badgeImage: some View{
        AsyncImage(url: viewModel.gymLeader.gymBadge) { image in
            image
                .resizable()
                .cornerRadius(6)
        } placeholder: {
            ProgressView()
        }
        .frame(width: 10, height: 10)
    }
    
 
        

}//end of BattlesDetail


/*
 HStack {
     Text("Types:")
         .font(Font.custom("Minecraft", size: 13))
         .padding(.trailing, 5)
     ForEach(viewModel.pokemon.types, id: \.self) { typ in Text(typ).font(Font.custom("Minecraft", size: 10))}
 }
 */
struct PokemonRow: View {
    let pokemon: Pokemon
    var body: some View {
        AsyncImage(url: pokemon.image) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            Image(systemName: "circle")
        }
        .frame(width: 200, height: 200)
        Text(pokemon.name).font(Font.custom("Minecraft", size:15))
    }
}




//struct BattlesDetail_Previews: PreviewProvider {
//    static let pokemonStore = PokemonStore()
//    static let viewModel = BattleDetailView(pokemonStore)
//    static var previews: some View {
//        BattlesDetail()
//    }
//}
