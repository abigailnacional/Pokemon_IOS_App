import Foundation

struct Pokemon: Identifiable, Codable, Hashable {
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

