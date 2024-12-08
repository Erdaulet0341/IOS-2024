import UIKit


class CountryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    var onTap: ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        image.layer.cornerRadius = 10
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 1.5
        image.clipsToBounds = true
    }
    
    func configure(with model: Country) {
        image.image = model.image
    }
}
