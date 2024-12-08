import UIKit

class MusicCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var isLiked: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImageView.layer.cornerRadius = 8
        posterImageView.clipsToBounds = true
    }
    
    func configure(_ music: Music) {
        posterImageView.image = music.posterImage
        titleLabel.text = music.title
        genreLabel.text = music.genre
    }
}
