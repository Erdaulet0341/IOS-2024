import UIKit


class ShowLyrics: UIViewController {
    var track: Track?
    var lyrics: Lyrics?
    var likeStatus: Bool = false
    var progessBar: UIActivityIndicatorView!
    
    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var putLike: UIImageView!
    @IBOutlet weak var musicText: UITextView!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progessBar = UIActivityIndicatorView(style: .large)
        progessBar.center = view.center
        progessBar.hidesWhenStopped = true
        view.addSubview(progessBar)
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Backgroud")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        setupGestureRecognizers()
        loadTrackLyrics()
        checkTrackInLikes()
    }
    
    func loadTrackLyrics() {
        progessBar.startAnimating()
        progessBar.isHidden = false
        
        self.musicName.text = track?.title
        self.artistName.text = track?.artist.name
        if let imageUrlString = track?.cover_image, let imageUrl = URL(string: imageUrlString) {
            self.coverImage.kf.setImage(with: imageUrl)
        }
        
        guard let trackId = track?.id else {
            return
        }

        ApiClient.shared.getLyricsByTrackId(trackId: trackId) { result in
            DispatchQueue.main.async {
                self.progessBar.stopAnimating()
                self.progessBar.isHidden = true

                switch result {
                case .success(let lyrics):
                    self.lyrics = lyrics
                    self.musicText.text = lyrics.text
                case .failure(let error):
                    self.musicText.text = "No Lyrics"
                    print("Error fetching lyrics: \(error)")
                }
            }
        }
    }

    
    private func setupGestureRecognizers() {
        addTapAnimation(to: backButton, action: #selector(backTapped))
        addTapAnimation(to: putLike, action: #selector(likeTapped))
    }
    
    private func addTapAnimation(to imageView: UIImageView, action: Selector) {
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: action)
        imageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func backTapped() {
        animateView(backButton)
        dismiss(animated: true)
    }
    
    @objc private func likeTapped() {
        animateView(putLike)

        guard let track = track else { return }

        if likeStatus {
            UserDefaultsClient.shared.deleteFromLikedTracks(trackId: track.id)
        } else {
            UserDefaultsClient.shared.saveToLikedTracks(track: track)
        }

        likeStatus.toggle()
        updateLikeImage()
    }
    
    private func checkTrackInLikes() {
        guard let track = track else { return }
        let likedTracks = UserDefaultsClient.shared.getLikedTracks()
        likeStatus = likedTracks.contains(where: { $0.id == track.id })
        updateLikeImage()
    }

    private func updateLikeImage() {
        let imageName = likeStatus ? "heart.fill" : "heart"
        let image = UIImage(systemName: imageName)?.withTintColor(likeStatus ? .red : .black, renderingMode: .alwaysOriginal)
        putLike.image = image
    }
}
