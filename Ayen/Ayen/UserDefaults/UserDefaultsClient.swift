import Foundation


class UserDefaultsClient {

    static let shared = UserDefaultsClient()
    private let likedTracksKey = "likedTracks"

    private init() {}

    func saveToLikedTracks(track: Track) {
        var likedTracks = getLikedTracks()
        if !likedTracks.contains(where: { $0.id == track.id }) {
            likedTracks.append(track)
            if let encodedTrack = try? JSONEncoder().encode(track) {
                UserDefaults.standard.set(encodedTrack, forKey: "\(likedTracksKey)_\(track.id)")
            }
        }
    }

    func deleteFromLikedTracks(trackId: Int) {
        var likedTracks = getLikedTracks()
        if let index = likedTracks.firstIndex(where: { $0.id == trackId }) {
            likedTracks.remove(at: index)
            UserDefaults.standard.removeObject(forKey: "\(likedTracksKey)_\(trackId)")
        }
    }

    func getLikedTracks() -> [Track] {
        var tracks: [Track] = []
        let allKeys = UserDefaults.standard.dictionaryRepresentation().keys
        for key in allKeys where key.starts(with: likedTracksKey) {
            if let data = UserDefaults.standard.data(forKey: key),
               let track = try? JSONDecoder().decode(Track.self, from: data) {
                tracks.append(track)
            }
        }
        return tracks
    }
}

