struct ArtistSearchResponse: Decodable {
    let artists: [Artist]
}

struct Artist: Decodable {
    let id: String
    let name: String
    let disambiguation: String?
}


struct Track: Decodable {
    let id: String
    let title: String
    let length: Int?

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case length = "track-length" // Map to actual JSON key
    }
}
