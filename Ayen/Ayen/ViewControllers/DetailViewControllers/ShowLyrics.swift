import UIKit


class ShowLyrics: UIViewController {
    
    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var putLike: UIImageView!
    @IBOutlet weak var musicText: UITextView!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Backgroud")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        setupGestureRecognizers()
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
        print("Back button clicked")
        dismiss(animated: true)
    }
    
    @objc private func likeTapped() {
        animateView(putLike)
        print("Like button clicked")
    }
}
