import UIKit

class AlbumAllCell: UITableViewCell {
    
    @IBOutlet weak var _image: UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        _image.layer.cornerRadius = 8
        _image.clipsToBounds = true
    }
    
    func configure(_ album: Album) {
        if let imageUrlString = album.cover_image, let imageUrl = URL(string: imageUrlString) {
            _image.kf.setImage(with: imageUrl)
        }
    }
}
