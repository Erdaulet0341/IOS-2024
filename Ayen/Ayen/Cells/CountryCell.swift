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
        if let imageUrlString = model.image, let imageUrl = URL(string: imageUrlString) {
            image.kf.setImage(with: imageUrl)
        }
    }
}
