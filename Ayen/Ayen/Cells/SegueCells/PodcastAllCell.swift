import UIKit

class PodcastAllCell: UITableViewCell {
    
    @IBOutlet weak var _image: UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        _image.layer.cornerRadius = 8
        _image.clipsToBounds = true
    }
    
    func configure(_ podcast: Podcast) {
        if let imageUrlString = podcast.cover_image, let imageUrl = URL(string: imageUrlString) {
            _image.kf.setImage(with: imageUrl)
        }
    }
}
