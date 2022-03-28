import SwiftUI

struct PokemonDetail: View {
    @StateObject var viewModel: PokemonDetailView
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: viewModel.pokemon.image) { image in
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
