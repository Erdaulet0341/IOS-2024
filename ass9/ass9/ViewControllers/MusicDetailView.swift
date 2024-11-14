import UIKit

class MusicDetailView: UIViewController {
    
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var dismissButton: UIButton!
    
    private var music: Music?
    
    func configure(with music: Music?) {
        self.music = music
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDismissButton()
    }
    
    private func setupUI() {
        titleLabel.text = music?.title
        yearLabel.text = music?.year
        genreLabel.text = music?.genre
        descriptionTextView.text = music?.description
        posterImageView.image = music?.posterImage
    }

    private func setupDismissButton() {
        dismissButton.addTarget(self, action: #selector(dismissTapped), for: .touchUpInside)
    }
        
    @objc private func dismissTapped() {
        dismiss(animated: true)
    }
}
