import UIKit


class AlbumCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var onTap: ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.masksToBounds = false

        image.layer.cornerRadius = 20
        image.layer.borderColor = UIColor(named: "000000")?.cgColor
        image.layer.borderWidth = 1.5
        image.clipsToBounds = true

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowRadius = 4
    }
    
    func configure(with model: Album) {
        label.text = model.title
        if let imageUrlString = model.cover_image, let imageUrl = URL(string: imageUrlString) {
            image.kf.setImage(with: imageUrl)
        }
    }
}
