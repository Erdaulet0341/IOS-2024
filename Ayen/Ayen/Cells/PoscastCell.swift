import UIKit


class PoscastCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var onTap: ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 15
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        
        layer.masksToBounds = false
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowRadius = 4
        
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        
        
        image.layer.cornerRadius = image.frame.size.width / 2
        image.layer.borderColor = UIColor(named: "FF6B00").cgColor
        image.layer.borderWidth = 1.5
        image.clipsToBounds = true
    }
    
    func configure(with model: Podcast) {
        label.text = model.title
        if let imageUrlString = model.cover_image, let imageUrl = URL(string: imageUrlString) {
            image.kf.setImage(with: imageUrl)
        }
    }
}
