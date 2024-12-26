import Alamofire

class ApiClient {
    static let shared = ApiClient()
    private init() {}

    private let baseUrl = "https://exotic-haddock-inviting.ngrok-free.app/"

    private func request<T: Decodable>(
        endpoint: String,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        let url = baseUrl + endpoint
        AF.request(url).validate().responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    // Fetch all genres
    func getAllGenres(completion: @escaping (Result<[Genre], Error>) -> Void) {
        request(endpoint: "genres/", completion: completion)
    }

    // Fetch all countries
    func getAllCountries(limit: Int? = nil, offset: Int? = nil, completion: @escaping (Result<[Country], Error>) -> Void) {
        var endpoint = "countries/"
        if let limit = limit, let offset = offset {
            endpoint += "?limit=\(limit)&offset=\(offset)"
        }
        request(endpoint: endpoint, completion: completion)
    }

    // Fetch all artists
    func getAllArtists(completion: @escaping (Result<[Artist], Error>) -> Void) {
        request(endpoint: "artists/", completion: completion)
    }

    // Fetch all albums
    func getAllAlbums(limit: Int? = nil, offset: Int? = nil, completion: @escaping (Result<[Album], Error>) -> Void) {
        var endpoint = "albums/"
        if let limit = limit, let offset = offset {
            endpoint += "?limit=\(limit)&offset=\(offset)"
        }
        request(endpoint: endpoint, completion: completion)
    }

    // Fetch all tracks
    func getAllTracks(completion: @escaping (Result<[Track], Error>) -> Void) {
        request(endpoint: "tracks/", completion: completion)
    }

    // Fetch all podcasts
    func getAllPodcasts(limit: Int? = nil, offset: Int? = nil, completion: @escaping (Result<[Podcast], Error>) -> Void) {
        var endpoint = "podcasts/"
        if let limit = limit, let offset = offset {
            endpoint += "?limit=\(limit)&offset=\(offset)"
        }
        request(endpoint: endpoint, completion: completion)
    }

    // Additional Endpoint Methods

    // Search tracks by query
    func searchTracks(query: String, completion: @escaping (Result<[Track], Error>) -> Void) {
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
        request(endpoint: "tracks/search_tracks/?query=\(encodedQuery)", completion: completion)
    }

    // Get tracks by country ID
    func getTracksByCountry(countryId: Int, completion: @escaping (Result<[Track], Error>) -> Void) {
        request(endpoint: "tracks/get_tracks_of_country/?country_id=\(countryId)", completion: completion)
    }

    // Get tracks by artist ID
    func getTracksByArtist(artistId: Int, completion: @escaping (Result<[Track], Error>) -> Void) {
        request(endpoint: "tracks/get_tracks_of_artist/?artist_id=\(artistId)", completion: completion)
    }

    // Get tracks by album ID
    func getTracksByAlbum(albumId: Int, completion: @escaping (Result<[Track], Error>) -> Void) {
        request(endpoint: "tracks/get_tracks_of_album/?album_id=\(albumId)", completion: completion)
    }

    // Get tracks by genre ID
    func getTracksByGenre(genreId: Int, completion: @escaping (Result<[Track], Error>) -> Void) {
        request(endpoint: "tracks/get_tracks_of_genre/?genre_id=\(genreId)", completion: completion)
    }
    
    // Get lyrics by track ID
    func getLyricsByTrackId(trackId: Int, completion: @escaping (Result<Lyrics, Error>) -> Void) {
        request(endpoint: "lyrics/\(trackId)", completion: completion)
    }
}
