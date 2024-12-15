import UIKit

class AlbumAllCell: UITableViewCell {
    
    @IBOutlet weak var _image: UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        _image.layer.cornerRadius = 8
        _image.clipsToBounds = true
    }
    
    func configure(_ album: Album) {
        _image.image = album.image
    }
}
