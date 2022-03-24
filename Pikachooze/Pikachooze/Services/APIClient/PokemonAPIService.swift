import Foundation

struct PokemonAPIService {
    
    func fetchPokemons(number: Int) async throws -> [Pokemon] {
        let url = PokemonEndpoint.baseUrl
        let body = PokemonEndpoint.pokemon(first: number)
        let responseData: PokemonEndpoint.ResponseData = try await GraphQLAPI().performRequest(url: url, body: body, number: number)
        return responseData.pokemons ?? []
    }
    
    
}

