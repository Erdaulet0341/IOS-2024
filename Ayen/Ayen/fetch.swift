import Alamofire

class MusicBrainzAPI {
    static let baseURL = "https://musicbrainz.org/ws/2"

    static func fetchTracks(artistID: String, limit: Int, offset: Int, completion: @escaping (Result<[Track], Error>) -> Void) {
        let urlString = "\(baseURL)/recording?artist=\(artistID)&limit=\(limit)&offset=\(offset)&fmt=json"
        
        AF.request(urlString).responseDecodable(of: TrackSearchResponse.self) { response in
            switch response.result {
            case .success(let trackResponse):
                completion(.success(trackResponse.recordings))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

struct TrackSearchResponse: Decodable {
    let recordings: [Track]
}

