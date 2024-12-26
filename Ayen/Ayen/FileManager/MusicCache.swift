import Foundation

class MusicCache {
    static let shared = MusicCache()
    
    private let cacheDirectory: URL
    
    private init() {
        let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        cacheDirectory = paths[0].appendingPathComponent("MusicCache")
        createCacheDirectory()
    }
    
    private func createCacheDirectory() {
        if !FileManager.default.fileExists(atPath: cacheDirectory.path) {
            try? FileManager.default.createDirectory(at: cacheDirectory, withIntermediateDirectories: true, attributes: nil)
        }
    }
    
    func fileURL(for trackID: Int) -> URL {
        return cacheDirectory.appendingPathComponent("\(trackID).mp3")
    }
    
    func fileExists(for trackID: Int) -> Bool {
        let fileURL = self.fileURL(for: trackID)
        return FileManager.default.fileExists(atPath: fileURL.path)
    }
    
    func saveFile(from location: URL, for trackID: Int) throws {
        let fileURL = self.fileURL(for: trackID)
        try? FileManager.default.removeItem(at: fileURL)
        try FileManager.default.copyItem(at: location, to: fileURL)
    }
}
