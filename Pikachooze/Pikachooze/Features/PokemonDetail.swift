import Foundation
import SwiftUI

struct PokemonDetail: View {
    @StateObject var viewModel: DetailView
    
    var image: some View {
        AsyncImage(url: viewModel.pokemon.image) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            if viewModel.pokemon.image != nil {
                ProgressView()
            }
            else{
                Image(systemName: "x.circle.fill")
            }
        }
        .frame(maxWidth: 200, maxHeight: 200) .cornerRadius(20)
    }
    
    var body: some View {
        ScrollView{
            VStack{
                image
                Text(viewModel.pokemon.name)
                    .bold()
            }
        }
    }
}

struct Detail_Previews: PreviewProvider {
    static let viewModel = DetailView(apiService: PokemonAPIService(), pokemon: Pokemon.)
    static var previews: some View {
        PokemonDetail(pokemon: )
    }
}

