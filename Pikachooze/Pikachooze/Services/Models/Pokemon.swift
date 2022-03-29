import Foundation

struct Pokemon: Identifiable, Codable {
    var id: String
    var number: String
    var name: String
    var nickname: String?
    var classification: String
    var types: [String]
    var resistant: [String]
    var weaknesses: [String]
    var image: URL
}

