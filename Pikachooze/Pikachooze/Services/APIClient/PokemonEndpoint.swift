import Foundation

struct PokemonEndpoint {
    static let baseUrl = "https://graphql-pokemon2.vercel.app"
    
    static func pokemon(first: Int) -> String{
        return """
        query pokemons($first: Int!){
            pokemons(first: $first){
                id
                number
                name
                classification
                types
                resistant
                weaknesses
                image
            }
        }
        """
    }
    
    struct ResponseData: Decodable {
        let pokemons: [Pokemon]?
    }

}






