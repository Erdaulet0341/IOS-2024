import UIKit

class ListTrackCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lenghtLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImageView.layer.cornerRadius = 8
        posterImageView.clipsToBounds = true
    }
    
    func configure(_ track: Track) {
        if let imageUrlString = track.cover_image, let imageUrl = URL(string: imageUrlString) {
            posterImageView.kf.setImage(with: imageUrl)
        }
        titleLabel.text = track.title
        lenghtLabel.text = track.length
    }
}
