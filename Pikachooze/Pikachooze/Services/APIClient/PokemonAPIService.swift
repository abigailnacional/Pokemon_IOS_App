import Foundation

struct PokemonAPIService {
    
    func fetch(number: Int) async throws -> [Pokemon] {
        let url = PokemonEndpoint.baseUrl
        let body = PokemonEndpoint.pokemon(first: number)
        let responseData: PokemonEndpoint.ResponseData = try await GraphQLAPI().performRequest(url: url, body: body, number: number)
        return responseData.pokemons ?? []
    }
    
    //  func createMovie(_ movie: Movie) throws -> Movie {
    //    print("I AM TRYING TO CREATE")
    //    return movie
    //  }
    //
    //  func updateMovie(_ movie: Movie) throws -> Movie {
    //    print("I AM TRYING TO UPDATE")
    //    return movie
    //  }
    //
    //  func deleteMovie(_ movie: Movie) throws -> Movie {
    //    print("I AM TRYING TO DELETE")
    //    return movie
    //  }
}

