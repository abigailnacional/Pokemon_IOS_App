import Foundation


struct Payload<T: Encodable>: Encodable {
    let variables: T
    let query: String
    let operationName: String
}

struct GraphQLAPI: APIClient {
    let session: URLSession = .shared
    
    func performRequest<ResponseData: Decodable>(url: String, body: String, number: Int) async throws -> ResponseData {
        guard let url = URL(string: url) else { throw APIError.invalidUrl(url) }
        var request = URLRequest(url: url)
        request.httpBody = (body + "\nvariables {first: \(number)}").data(using: .utf8)
        let payload = Payload(variables: ["first": number], query: body, operationName: "pokemons")
        request.httpBody = try! JSONEncoder().encode(payload)
        request.httpMethod = "post"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let response: GraphQLEndpoint<ResponseData>.Response = try await perform(request: request)
        if let error = response.responseError?.first { throw GraphQLError.queryError("\(error.message ?? "") details: \(error.details ?? "")") }
        guard let responseData = response.responseData else { throw GraphQLError.noData}
        return responseData
    }
}

enum GraphQLError: LocalizedError {
    case queryError(String)
    case noData
    
    var errorDescription: String? {
        switch self {
        case .queryError(let message): return "GraphQL query error: \(message)"
        case .noData: return "GraphQL Error: no data"
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .queryError:
            return "Please fix the query."
        case .noData: return "Unknown solution"
        }
    }
}

