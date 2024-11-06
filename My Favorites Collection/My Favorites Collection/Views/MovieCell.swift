import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImageView.layer.cornerRadius = 8
        posterImageView.clipsToBounds = true
    }
    
    func configure(with movie: Movie) {
        posterImageView.image = movie.posterImage
        titleLabel.text = movie.title
        yearLabel.text = movie.year
        genreLabel.text = movie.genre
    }
}
