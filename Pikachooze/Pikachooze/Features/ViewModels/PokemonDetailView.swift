//import Foundation
//import Combine
//
//@MainActor
//class PokemonDetailView: ObservableObject {
//    let apiService: PokemonAPIService
//
//    @Published private(set) var state: LoadingState = .notAvailable
//    //private var store: PokemonStore
//    private var cancellables: Set<AnyCancellable> = []
//
//    @Published var inReadingList: Bool = false
//    @Published var hasAPIError: Bool = false
//    @Published var myPokemon: Pokemon
//
//    init(apiService: PokemonAPIService, pokemon: Pokemon) {
//        self.apiService = apiService
//        self.myPokemon = myPokemon
//        //self.store = store
//    }
//}
