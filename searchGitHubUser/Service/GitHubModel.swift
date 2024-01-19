import Foundation

struct GitHubModel: Codable {
    let login: String
    let id: Int
    let followers: Int
    let avatar_url: String
    let bio: String
}
