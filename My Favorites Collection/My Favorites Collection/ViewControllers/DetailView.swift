import UIKit

class DetailView: UIViewController {
    
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var dismissButton: UIButton!
    
    private var movie: Movie?
    
    func configure(with movie: Movie?) {
        self.movie = movie  
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDismissButton()
    }
    
    private func setupUI() {
        titleLabel.text = movie?.title
        yearLabel.text = movie?.year
        genreLabel.text = movie?.genre
        descriptionTextView.text = movie?.description
        posterImageView.image = movie?.posterImage
    }

    private func setupDismissButton() {
        dismissButton.addTarget(self, action: #selector(dismissTapped), for: .touchUpInside)
    }
        
    @objc private func dismissTapped() {
        dismiss(animated: true)
    }
}
