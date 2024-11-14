import UIKit

class BookCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImageView.layer.cornerRadius = 8
        posterImageView.clipsToBounds = true
    }
    
    func configure(_ book: Book) {
        posterImageView.image = book.posterImage
        titleLabel.text = book.title
        yearLabel.text = book.year
        genreLabel.text = book.genre
    }
}
