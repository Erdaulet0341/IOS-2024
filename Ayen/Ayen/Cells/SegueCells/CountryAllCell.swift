import UIKit

class CountryAllCell: UITableViewCell {
    
    @IBOutlet weak var _image: UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        _image.layer.cornerRadius = 8
        _image.clipsToBounds = true
    }
    
    func configure(_ country: Country) {
        _image.image = country.image
    }
}
