import Foundation

struct Album: Codable {
    let id: Int
    let title: String
    let artist: Artist
    let release_date: String
    let cover_image: String?
    let description: String?
    let created_at: String
}
