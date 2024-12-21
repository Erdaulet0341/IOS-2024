import Foundation

struct Podcast: Codable {
    let id: Int
    let title: String
    let video_url: String
    let release_date: String
    let cover_image: String?
    let description: String?
    let created_at: String
}
