import UIKit

class PlayMusic: UIViewController {
    var currentMusic: Music?

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
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Backgroud")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        setupGestureRecognizers()
        updateUI()
        
    }
    
    private func updateUI() {
        guard let music = currentMusic
        else {
            print("error")
            return
        }
        musicName.text = music.title
        artistName.text = music.genre
        coverImage.image = music.posterImage
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
    
    @objc private func playPauseTapped() {
        animateView(playPauseButton)
        print("Play/Pause button clicked")
    }
    
    @objc private func previousTapped() {
        animateView(previousbutton)
        print("Previous button clicked")
    }
    
    @objc private func nextTapped() {
        animateView(nextButton)
        print("Next button clicked")
    }
    
    @objc private func likeTapped() {
        animateView(putLike)
        print("Like button clicked")
    }
    
    @objc private func backTapped() {
        animateView(backButton)
        print("Back button clicked")
        dismiss(animated: true)
    }
    
    @IBAction func viewLyricsButtonTapped(_ sender: UIButton) {
        print("View Lyrics button clicked")
        performSegue(withIdentifier: "showLyrics", sender: self)
    }
}
