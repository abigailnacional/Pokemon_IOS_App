import SwiftUI

struct Fight: View {
    @StateObject var viewModel: FightView
    @State var isActive = false
    var body: some View {
        if(viewModel.playerWon()){
            NavigationLink(destination: Victory(gymBadgeURL: viewModel.gymLeader.gymBadge), isActive: $isActive ) {
                Button (action:{
                    isActive = true
                }){
                Text("Simulate Fight!")
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
            }
        } else{
            NavigationLink(destination: Defeat(gymBadgeURL: viewModel.gymLeader.gymBadge), isActive: $isActive ) {
                Button (action:{
                    isActive = true
                }){
                Text("Simulate Fight!")
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
            }
        }
        
        Button(action:{viewModel.suggestionButtonTapped()}, label :{viewModel.usingSuggested ? Text("Use Your Own Order ") : Text("Use Suggested Order")})
        HStack{
            List(viewModel.gymLeader.gymPokemon) { gympokemon in
                VStack{
                    AsyncImage(url: gympokemon.image) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(maxWidth: 100, maxHeight: 100)
                    Text(gympokemon.name)
                }
            }
            if(viewModel.usingSuggested){
                List(viewModel.suggestedOrdering) { inventpokemon in
                    VStack{
                        AsyncImage(url: inventpokemon.image) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(maxWidth: 100, maxHeight: 100)
                        Text(inventpokemon.name)
                    }
                }
            } else {
                List(viewModel.inventoryPokemon) { inventpokemon in
                    VStack {
                        AsyncImage(url: inventpokemon.image) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(maxWidth: 100, maxHeight: 100)
                        Text(inventpokemon.name)
                    }
                }
            }
        }
     }
}


//struct PlayerFight: View {
//    @ObservedObject var viewModel : FightView
//    var body: some View {
//
//    }
//}


//struct Fight_Previews: PreviewProvider {
//    static var previews: some View {
//        Fight()
//    }
//}
