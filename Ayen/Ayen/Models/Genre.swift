import Foundation

struct Genre: Codable {
    let id: Int
    let name: String
    let description: String?
    let created_at: String
    let image: String?
}
