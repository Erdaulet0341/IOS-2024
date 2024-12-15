import UIKit

class PodcastAllCell: UITableViewCell {
    
    @IBOutlet weak var _image: UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        _image.layer.cornerRadius = 8
        _image.clipsToBounds = true
    }
    
    func configure(_ podcast: Podcast) {
        _image.image = podcast.image
    }
}
