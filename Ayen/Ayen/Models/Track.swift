import Foundation

struct Track: Codable {
    let id: Int
    let title: String
    let album: Album
    let artist: Artist
    let genres: [Genre]?
    let audio_file: String
    let cover_image: String?
    let length: String
    let release_date: String
    let country: Country
    let play_count: Int
    let likes_count: Int
    let created_at: String
}

