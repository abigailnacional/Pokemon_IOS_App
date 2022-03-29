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
                .frame(maxWidth: 150, maxHeight: 150)
                Text(viewModel.pokemon.name)
                    .font(.headline)
                    .textCase(.uppercase)
            }
            .padding(30)
            .border(Color.gray, width: 5)
            .cornerRadius(6)
            VStack(alignment: .leading){
                Text("Nickname")
                    .padding(.top, 20)
                Text("Type")
                Text("Gender")
            }
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .primaryAction) { Button(action: {
                viewModel.buttonTapped()
            }, label: {viewModel.inInventoryList ? Text ("Remove") : Text("Add")}
            )
                
            }
        }
    }
}


//struct PokemonDetail_Previews: PreviewProvider {
//    static let viewModel = PokemonDetailView(apiService: PokemonAPIService(), book: Book.previewData[0])
//    static var previews: some View {
//        PokemonScreen(viewModel: viewModel)
//    }
//}
