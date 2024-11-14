import UIKit

class MusicCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImageView.layer.cornerRadius = 8
        posterImageView.clipsToBounds = true
    }
    
    func configure(_ music: Music) {
        posterImageView.image = music.posterImage
        titleLabel.text = music.title
        yearLabel.text = music.year
        genreLabel.text = music.genre
    }
}
