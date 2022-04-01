
import SwiftUI

struct Battles: View {
    @StateObject var viewModel: BattleView
    
    var body: some View {
        NavigationView {
            List(GymLeader.previewData) { battle in
                NavigationLink(destination: BattlesDetail(viewModel: BattleView(viewModel.gymLeader, viewModel.pokeStore))) {
                 GymLeaderRow(gymLeader: battle)
                }
                .navigationTitle("Battles")
            }
        }
    }
}

struct GymLeaderRow: View {
    let gymLeader: GymLeader
    
    var body: some View {
        HStack(alignment: .top) {
            leaderImage
            VStack(alignment: .leading) {
                Text(gymLeader.name)
                badgeImage
            }
        }
    }
    
    var leaderImage: some View {
        AsyncImage(url:gymLeader.image) { image in
            image
                .resizable()
                .cornerRadius(6)
        } placeholder: {
                ProgressView()
        }
        .frame(width: 50, height: 50)
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
