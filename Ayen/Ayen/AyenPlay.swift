import UIKit


class AudioPlayerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listPodcast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let podcastCell = collectionView.dequeueReusableCell(withReuseIdentifier: "podcastcell", for: indexPath)
        as! PoscastCollectionViewCell
        
        let currentModel = listPodcast[indexPath.row]
        podcastCell.image.image = currentModel.image
        podcastCell.label.text = currentModel.label
        
        // Custom styling for all cells
        podcastCell.layer.cornerRadius = 15
        podcastCell.layer.borderColor = UIColor.black.cgColor
        podcastCell.layer.borderWidth = 1
        
        podcastCell.image.layer.cornerRadius = podcastCell.image.frame.size.width / 2
        podcastCell.image.layer.borderColor = UIColor(named: "FF6B00").cgColor
        podcastCell.image.layer.borderWidth = 1.5
        podcastCell.image.clipsToBounds = true
        
        podcastCell.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped(_:)))
        podcastCell.addGestureRecognizer(tapGesture)
        
        return podcastCell
    }
    
    
    @IBOutlet weak var image_right: UIImageView!
    
    @IBOutlet weak var podcastViewAll: UILabel!
    @IBOutlet weak var search_bar: UISearchBar!
    @IBOutlet weak var collectionViewPodcast: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image_right.layer.cornerRadius = 30

        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Backgroud")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        collectionViewPodcast.delegate = self
        collectionViewPodcast.dataSource = self
        
        search_bar.layer.cornerRadius = 20
        search_bar.searchTextField.layer.cornerRadius = 10
        search_bar.searchTextField.layer.masksToBounds = true
        search_bar.layer.shadowColor = UIColor.black.cgColor
        search_bar.layer.shadowOpacity = 0.3
        search_bar.layer.shadowOffset = CGSize(width: 4, height: 4)
        search_bar.layer.shadowRadius = 4
        
        podcastViewAll.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped1))
        podcastViewAll.addGestureRecognizer(tapGesture)
        
        
    }
    
    @objc func labelTapped1() {
        print("Text label clicked!")
    }
    
    @objc func cellTapped(_ sender: UITapGestureRecognizer) {
            if let cell = sender.view as? UICollectionViewCell {
                if let podcastCell = cell as? PoscastCollectionViewCell {
                    print("Cell with label '\(podcastCell.label.text ?? "")' clicked")
                }
            }
        }
    
}


extension UIColor {
    convenience init(named hex: String) {
        let hexSanitized = hex.replacingOccurrences(of: "#", with: "")
        
        if hexSanitized.count == 6 {
            let scanner = Scanner(string: hexSanitized)
            var rgb: UInt64 = 0
            scanner.scanHexInt64(&rgb)
            
            let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(rgb & 0x0000FF) / 255.0
            
            self.init(red: r, green: g, blue: b, alpha: 1.0)
        } else {
            self.init(red: 0, green: 0, blue: 0, alpha: 1.0)
        }
    }
    
}
