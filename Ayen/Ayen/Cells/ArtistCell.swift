import UIKit

class ArtistCell: UITableViewCell {
    
    @IBOutlet weak var _image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var country: UILabel!
    
    override func awakeFromNib() {
        
        layer.cornerRadius = 15
        layer.borderColor = UIColor.orange.cgColor
        layer.borderWidth = 1
        
        super.awakeFromNib()
        _image.layer.cornerRadius = 8
        _image.clipsToBounds = true
    }
    
    func configure(_ artist: Artist) {
        if let imageUrlString = artist.image, let imageUrl = URL(string: imageUrlString) {
            _image.kf.setImage(with: imageUrl)
        }
        name.text = artist.name
        country.text = artist.country.name
    }
}
