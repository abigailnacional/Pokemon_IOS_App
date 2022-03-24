import SwiftUI

struct PokeScreen: View {
    @StateObject var viewModel: PokemonDetailView
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading: ProgressView()
            case .notAvailable: Text("Cannot reach API")
            case .failed(_): Text("Error")
            case .success(let pokemon): PokemonDetail(viewModel: viewModel, pokemon: pokemon)
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) { Button(viewModel.buttonLabel()) { viewModel.buttonTapped() } }
                    }
            }
        }
    }
}

struct PokemonDetail: View {
    @StateObject var viewModel: PokemonDetailView
    let pokemon: Pokemon
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: pokemon.image) { image in
                    image
                        .resizable()
                } placeholder: {
                    Image(systemName: "book.fill")
                }
            }
            .frame(maxWidth: 115, maxHeight: 185)
            .cornerRadius(6)
            Text("Nickname")
            Text("Type")
            Text("Gender")
        }
    }
}


//struct PokemonDetail_Previews: PreviewProvider {
//    static let viewModel = PokemonDetailView(apiService: PokemonAPIService(), book: Book.previewData[0])
//    static var previews: some View {
//        PokemonScreen(viewModel: viewModel)
//    }
//}
