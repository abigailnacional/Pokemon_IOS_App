import SwiftUI

struct PokemonDetail: View {
    @StateObject var viewModel: PokemonDetailView
    @State var nickname = ""
    
    var body: some View {
        ScrollView {
            VStack() {
                Text(viewModel.pokemon.classification)
                    .font(Font.custom("Minecraft", size: 12))
                    .foregroundColor(.gray)
                Spacer()
                AsyncImage(url: viewModel.pokemon.image) { image in
                    image
                        .resizable()
                } placeholder: {
                    Image(systemName: "book.fill")
                }
                .frame(maxWidth: 150, maxHeight: 150)
                Text(viewModel.pokemon.nickname ?? viewModel.pokemon.name)
                    .font(Font.custom("Minecraft", size: 20))
                    .textCase(.uppercase)
            }
            .padding(30)
            .border(Color.gray, width: 5)
            .cornerRadius(6)
            Spacer()
            VStack(alignment: .leading) {
                TextField("Enter or Edit Nickname!", text: $nickname)
                    .onSubmit { viewModel.setNickname(input: nickname) }
                    .disableAutocorrection(true)
                Spacer()
                Spacer()
                Spacer()
                HStack(spacing: 40) {
                    VStack() {
                        Text("Types:")
                            .font(Font.custom("Minecraft", size: 20))
                            .padding(.trailing, 5)
                        ForEach(viewModel.pokemon.types, id: \.self) { typ in Text(typ).font(Font.custom("Minecraft", size: 15))}
                    }
                    VStack {
                        Text("Resistances:")
                            .font(Font.custom("Minecraft", size: 20))
                        ForEach(viewModel.pokemon.resistant, id: \.self) { rest in Text(rest).font(Font.custom("Minecraft", size: 15))}
                    }
                }
            }
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .primaryAction) { Button(action: {
                viewModel.buttonTapped()
            }, label: {viewModel.inInventoryList ? Text ("Remove") : Text("Add")}
            )
            .alert("Oh no! Your inventory has reached maximum capacity :(", isPresented: $viewModel.isFull) {
                Button("OK", role: .cancel) { }
            }
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
