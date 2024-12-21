import Foundation

struct Artist: Codable {
    let id: Int
    let name: String
    let country: Country
    let bio: String?
    let image: String?
    let created_at: String
}
