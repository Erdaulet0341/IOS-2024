import Alamofire

class ApiClient {
    static let shared = ApiClient()
    private init() {}

    private let baseUrl = "https://0235-147-30-44-191.ngrok-free.app/"

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
    func getAllCountries(completion: @escaping (Result<[Country], Error>) -> Void) {
        request(endpoint: "countries/", completion: completion)
    }

    // Fetch all artists
    func getAllArtists(completion: @escaping (Result<[Artist], Error>) -> Void) {
        request(endpoint: "artists/", completion: completion)
    }

    // Fetch all albums
    func getAllAlbums(completion: @escaping (Result<[Album], Error>) -> Void) {
        request(endpoint: "albums/", completion: completion)
    }

    // Fetch all tracks
    func getAllTracks(completion: @escaping (Result<[Track], Error>) -> Void) {
        request(endpoint: "tracks/", completion: completion)
    }

    // Fetch all podcasts
    func getAllPodcasts(completion: @escaping (Result<[Podcast], Error>) -> Void) {
        request(endpoint: "podcasts/", completion: completion)
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
