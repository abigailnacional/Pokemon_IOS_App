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
                    ProgressView()
                }
                .frame(maxWidth: 150, maxHeight: 150)
                .frame(minWidth: 150, minHeight: 150)
                Text(viewModel.pokemon.nickname ?? viewModel.pokemon.name)
                    .font(Font.custom("Minecraft", size: 20))
                    .textCase(.uppercase)
            }
            .foregroundColor(Color.gray)
            .padding(10)
            .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 5)
                    )
            .padding(.top, 30)
            .padding(.bottom, 20)
            VStack(alignment: .leading) {
                HStack {
                    Text("Enter or Edit Nickname:")
                        .font(Font.custom("Minecraft", size: 13))
                    TextField(viewModel.pokemon.nickname ?? viewModel.pokemon.name, text: $nickname)
                        .onSubmit { viewModel.setNickname(input: nickname) }
                        .disableAutocorrection(true)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(Font.custom("Minecraft", size: 13))
                }
                Spacer()
                Spacer()
                Spacer()
                VStack(spacing: 40) {
                    HStack {
                        Text("Types:")
                            .font(Font.custom("Minecraft", size: 13))
                            .padding(.trailing, 5)
                        ForEach(viewModel.pokemon.types, id: \.self) { typ in Text(typ).font(Font.custom("Minecraft", size: 10))}
                    }
                    HStack {
                        Text("Resistances:")
                            .font(Font.custom("Minecraft", size: 13))
                        ForEach(viewModel.pokemon.resistant, id: \.self) { rest in Text(rest).font(Font.custom("Minecraft", size: 10))}
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
