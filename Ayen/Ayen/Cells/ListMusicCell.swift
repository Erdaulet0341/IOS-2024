import UIKit

class ListMusicCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lenghtLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImageView.layer.cornerRadius = 8
        posterImageView.clipsToBounds = true
    }
    
    func configure(_ music: Music) {
        posterImageView.image = music.posterImage
        titleLabel.text = music.title
        lenghtLabel.text = music.length
    }
}
