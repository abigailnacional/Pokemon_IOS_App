
import SwiftUI

struct SearchScreen: View {
      @StateObject var viewModel: SearchView
    //@StateObject var viewM: PokemonDetailView

      var body: some View {
        Group {
          switch viewModel.state {
          case .loading:
            ProgressView()
          case .notAvailable:
            Text("Cannot reach API")
          case .failed:
            Text("Error")
          case .success:
              Search(viewModel: viewModel)
          }
        }
        .task { await viewModel.getPokemon() }
        .alert("Error", isPresented: $viewModel.hasAPIError, presenting: viewModel.state) { detail in
            Button("Retry") {
              Task { await viewModel.getPokemon() }
            }
            Button("Cancel") {}
          }
          message: { detail in
            if case let .failed(error) = detail {
              Text(error.localizedDescription)
            }
          }
      }
}

struct Search: View {
    @StateObject var viewModel: SearchView
    //@StateObject var viewM: PokemonDetailView
    
    var pokemon: [Pokemon] = []
    
    var body: some View {
        NavigationView{
            List(viewModel.filteredPokemon) { pokemon in
                NavigationLink(destination:
                                PokemonDetail()
                ) {
                    SearchRow(pokemon: pokemon)
                }
            }
            .searchable(text: $viewModel.searchText)
        }
        .navigationTitle("Choose Your Pokemon!")
    }
}


struct SearchRow: View {
    let pokemon: Pokemon
    
    var body: some View {
        HStack{
            AsyncImage(url: pokemon.image){
                image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: "circle")
            }
            .frame(maxWidth: 100, maxHeight: 100)
            Text(pokemon.name)
        }
    }
}

//struct Search_Previews: PreviewProvider {
//    static var previews: some View {
//        Search(viewModel: SearchView(apiService: PokemonAPIService()), viewM: PokemonDetailView(apiService: PokemonAPIService(), myPokemon: pokemon[1])
//    }
//}
