import SwiftUI
//
//struct PokemonScreen: View {
//    @StateObject var viewModel: PokemonDetailView
//
//    var body: some View {
//        Group {
//            switch viewModel.state {
//            case .loading: ProgressView()
//            case .notAvailable: Text("Cannot reach API")
//            case .failed(_): Text("Error")
//            case .success(): BookDetail(viewModel: viewModel)
//            }
//        }
//        .task { await viewModel.getSummary() }
//        .alert("Error", isPresented: $viewModel.hasAPIError, presenting: viewModel.state) { detail in
//            Button("Retry") {
//                Task { await viewModel.getSummary() }
//            }
//            Button("Cancel") {}
//        }
//    message: { detail in
//        if case let .failed(error) = detail {
//            Text(error.localizedDescription)
//        }
//    }
//    }
//}


struct PokemonDetail: View {
    //@StateObject var viewModel: PokemonDetailView
    
    var body: some View {
        ScrollView {
//            VStack {
//                AsyncImage(url: viewModel.myPokemon.image) { image in
//                    image
//                        .resizable()
//                } placeholder: {
//                    if viewModel.myPokemon.image != nil {
//                        ProgressView()
//                    } else {
//                        Image(systemName: "book.fill")
//                    }
//                }
//                .frame(maxWidth: 115, maxHeight: 185)
//                .cornerRadius(6)
//            }
        }
    }
}

//
//struct BookDetail_Previews: PreviewProvider {
//    static let viewModel = BookDetailVM(apiService: OpenLibraryAPIService(), book: Book.previewData[0])
//    static var previews: some View {
//        BookScreen(viewModel: viewModel)
//    }
//}
