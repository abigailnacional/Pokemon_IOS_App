
import SwiftUI

struct Battles: View {
    @StateObject var viewModel: BattleView
    
    var body: some View {
        List(viewModel.gymLeaders) { gymleader in
            NavigationLink(destination: BattlesDetail(viewModel: BattleDetailView(gymleader, viewModel.pokeStore))) {
             GymLeaderRow(gymLeader: gymleader)
            }
            .navigationTitle("Battles")
        }
    }
}

struct GymLeaderRow: View {
    let gymLeader: GymLeader
    
    var body: some View {
        HStack(alignment: .top) {
            leaderImage
            VStack(alignment: .leading) {
                Text(gymLeader.name).font(Font.custom("Minecraft", size: 20))
                Text(gymLeader.city).font(Font.custom("Minecraft", size: 15))
                badgeImage
            }
        }
    }
    
    var leaderImage: some View {
        AsyncImage(url:gymLeader.image) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
                ProgressView()
        }
        .frame(maxWidth: 100, maxHeight: 100)
    }
    
    var badgeImage: some View{
        AsyncImage(url: gymLeader.gymBadge) { image in
            image
                .resizable()
                .cornerRadius(6)
        } placeholder: {
            ProgressView()
        }
        .frame(width: 10, height: 10)
    }
    
}








//
//struct Battles_Previews: PreviewProvider {
//    static let pokeStore = PokemonStore()
//    static let gymLeader: GymLeader
//    static let viewModel = BattleView(gymLeader: gymLeader, pokeStore: pokeStore)
//    static var previews: some View {
//        Battles(viewModel: viewModel)
//    }
//}
