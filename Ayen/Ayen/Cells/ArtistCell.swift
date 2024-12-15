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
    
    func configure(_ genre: Artist) {
        _image.image = genre.image
        name.text = genre.name
        country.text = genre.country
    }
}
