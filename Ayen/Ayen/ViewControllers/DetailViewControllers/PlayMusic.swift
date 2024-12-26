import UIKit
import AVFoundation
import Kingfisher

class PlayMusic: UIViewController, AVAudioPlayerDelegate {
    var listTrack:[Track] = []
    var likeStatus: Bool = false

    var currentTrack: Track?
    var pause_image = UIImage(named: "pause") ?? UIImage()
    var play_image = UIImage(named: "play") ?? UIImage()
    var audioPlayer: AVAudioPlayer?
    var progressUpdateTimer: Timer?
    var isPlaying = false
    var currentDownloadTask: URLSessionDownloadTask?

    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var playPauseButton: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var previousbutton: UIImageView!
    @IBOutlet weak var viewLyricsButton: UIButton!
    @IBOutlet weak var nextButton: UIImageView!
    @IBOutlet weak var putLike: UIImageView!
    @IBOutlet weak var musicProgress: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coverImage.layer.cornerRadius = 20
        coverImage.clipsToBounds = true
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Backgroud")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        setupGestureRecognizers()
        updateUI()
        setupAudioPlayer()
        addProgressBarTapGesture()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        audioPlayer?.stop()
        stopProgressTimer()
        currentDownloadTask?.cancel()
        currentDownloadTask = nil
        isPlaying = false
    }
    
    private func updateUI() {
        guard let track = currentTrack
        else {
            return
        }
        musicName.text = track.title
        artistName.text = track.artist.name
        if let imageUrlString = track.cover_image, let imageUrl = URL(string: imageUrlString) {
            coverImage.kf.setImage(with: imageUrl)}
        
        checkTrackInLikes()

        }
    
    private func setupGestureRecognizers() {
        addTapAnimation(to: playPauseButton, action: #selector(playPauseTapped))
        addTapAnimation(to: previousbutton, action: #selector(previousTapped))
        addTapAnimation(to: nextButton, action: #selector(nextTapped))
        addTapAnimation(to: putLike, action: #selector(likeTapped))
        addTapAnimation(to: backButton, action: #selector(backTapped))
    }
    
    private func addTapAnimation(to imageView: UIImageView, action: Selector) {
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: action)
        imageView.addGestureRecognizer(tapGesture)
    }

    private func setupAudioPlayer() {
        guard let track = currentTrack else {
            print("Error: Invalid track")
            return
        }
        
        let fileURL = MusicCache.shared.fileURL(for: track.id)
        
        currentDownloadTask?.cancel()
        currentDownloadTask = nil
        
        if MusicCache.shared.fileExists(for: track.id) {
            loadAudioFromFile(url: fileURL)
        } else {
            guard let url = URL(string: track.audio_file) else {
                print("Error: Invalid audio file URL")
                return
            }
            
            musicProgress.progress = 0
            
            let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue.main)
            let downloadTask = session.downloadTask(with: url)
            self.currentDownloadTask = downloadTask
            downloadTask.resume()
        }
    }


    private func loadAudioFromFile(url: URL) {
        do {
            let data = try Data(contentsOf: url)
            self.audioPlayer = try AVAudioPlayer(data: data)
            self.audioPlayer?.delegate = self
            self.audioPlayer?.prepareToPlay()
            self.playMusic()
        } catch {
            print("Error preparing audio player: \(error)")
        }
    }


    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        guard flag else { return }
        
        pauseMusic()
        musicProgress.progress = 0
        
        if let currentIndex = listTrack.firstIndex(where: { $0.id == currentTrack?.id }) {
            let nextIndex = (currentIndex + 1) % listTrack.count
            currentTrack = listTrack[nextIndex]
            updateUI()
            setupAudioPlayer()
        }
    }

    
    private func playMusic() {
        audioPlayer?.play()
        isPlaying = true
        playPauseButton.image = pause_image
        startProgressTimer()
    }
    
    private func pauseMusic() {
        audioPlayer?.pause()
        isPlaying = false
        playPauseButton.image = play_image
        stopProgressTimer()
    }
    
    private func startProgressTimer() {
        progressUpdateTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
    }
    
    private func stopProgressTimer() {
        progressUpdateTimer?.invalidate()
        progressUpdateTimer = nil
    }
    
    @objc private func updateProgress() {
        guard let player = audioPlayer else { return }
        let progress = Float(player.currentTime / player.duration)
        musicProgress.setProgress(progress, animated: true)
    }
    
    private func addProgressBarTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(progressBarTapped(_:)))
        musicProgress.addGestureRecognizer(tapGesture)
        musicProgress.isUserInteractionEnabled = true
    }
    
    @objc private func progressBarTapped(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let player = audioPlayer, player.duration > 0 else { return }
        
        let location = gestureRecognizer.location(in: musicProgress)
        let progress = Float(location.x / musicProgress.bounds.width)
        
        let targetTime = Double(progress) * player.duration
        player.currentTime = targetTime
        musicProgress.setProgress(progress, animated: true)
        
        if !isPlaying {
            playMusic()
        }
    }
    
    @objc private func playPauseTapped() {
        animateView(playPauseButton)
        if isPlaying {
            pauseMusic()
        } else {
            playMusic()
        }
    }
    
    @objc private func previousTapped() {
        animateView(previousbutton)
        pauseMusic()
        musicProgress.progress = 0
        currentDownloadTask?.cancel()
        currentDownloadTask = nil
        if let currentIndex = listTrack.firstIndex(where: { $0.id == currentTrack?.id }) {
            let previousIndex = (currentIndex - 1 + listTrack.count) % listTrack.count
            currentTrack = listTrack[previousIndex]
            updateUI()
            setupAudioPlayer()
        }
    }

    @objc private func nextTapped() {
        animateView(nextButton)
        pauseMusic()
        musicProgress.progress = 0
        currentDownloadTask?.cancel()
        currentDownloadTask = nil
        if let currentIndex = listTrack.firstIndex(where: { $0.id == currentTrack?.id }) {
            let nextIndex = (currentIndex + 1) % listTrack.count
            currentTrack = listTrack[nextIndex]
            updateUI()
            setupAudioPlayer()
        }
    }
    
    @objc private func likeTapped() {
        animateView(putLike)

        guard let track = self.currentTrack else { return }

        if likeStatus {
            UserDefaultsClient.shared.deleteFromLikedTracks(trackId: track.id)
        } else {
            UserDefaultsClient.shared.saveToLikedTracks(track: track)
        }

        likeStatus.toggle()
        updateLikeImage()
    }
    
    private func checkTrackInLikes() {
        guard let track = self.currentTrack else { return }
        let likedTracks = UserDefaultsClient.shared.getLikedTracks()
        likeStatus = likedTracks.contains(where: { $0.id == track.id })
        updateLikeImage()
    }

    private func updateLikeImage() {
        let imageName = likeStatus ? "heart.fill" : "heart"
        let image = UIImage(systemName: imageName)?.withTintColor(likeStatus ? .systemGreen : .black, renderingMode: .alwaysOriginal)
        putLike.image = image
    }
    
    @objc private func backTapped() {
        animateView(backButton)
        audioPlayer?.stop()
        stopProgressTimer()
        currentDownloadTask?.cancel()
        currentDownloadTask = nil
        dismiss(animated: true)
    }

    
    @IBAction func viewLyricsButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "showLyrics", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLyrics" {
            if let showLyricsVC = segue.destination as? ShowLyrics {
                showLyricsVC.track = currentTrack
            }
        }
    }
}

extension PlayMusic: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        guard totalBytesExpectedToWrite > 0 else {
            print("Cannot calculate progress: totalBytesExpectedToWrite is unknown")
            return
        }
        
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        
        DispatchQueue.main.async {
            self.musicProgress.setProgress(progress, animated: true)
        }
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let track = currentTrack else { return }
        
        let fileURL = MusicCache.shared.fileURL(for: track.id)
        
        do {
            try MusicCache.shared.saveFile(from: location, for: track.id)
            loadAudioFromFile(url: fileURL)
        } catch {
            print("Error saving or loading file: \(error)")
        }
    }
}
