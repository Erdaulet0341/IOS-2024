import UIKit
import Kingfisher

class GenreCell: UITableViewCell {
    
    @IBOutlet weak var _image: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        
        layer.cornerRadius = 15
        layer.borderColor = UIColor.orange.cgColor
        layer.borderWidth = 1
        
        super.awakeFromNib()
        _image.layer.cornerRadius = 8
        _image.clipsToBounds = true
    }
    
    func configure(_ genre: Genre) {
        if let imageUrlString = genre.image, let imageUrl = URL(string: imageUrlString) {
            _image.kf.setImage(with: imageUrl)
        }
        
        name.text = genre.name
    }
}
