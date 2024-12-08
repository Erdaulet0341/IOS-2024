import UIKit

class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var imageRight: UIImageView!
    @IBOutlet weak var podcastViewAll: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionViewPodcast: UICollectionView!
    @IBOutlet weak var collectionViewAlbum: UICollectionView!
    @IBOutlet weak var collectionViewCountry: UICollectionView!
    @IBOutlet weak var albumViewAll: UILabel!
    @IBOutlet weak var countryViewAll: UILabel!
    
    // MARK: - Properties
    private let cornerRadius: CGFloat = 30
    private let searchBarShadowOffset = CGSize(width: 4, height: 4)
    private let searchBarShadowOpacity: Float = 0.4
    private let searchBarShadowRadius: CGFloat = 4
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGestures()
        setupCollectionView()
    }
    
    // MARK: - Setup Methods
    private func setupUI() {
        // Round image corner
        imageRight.layer.cornerRadius = cornerRadius
        
        // Set background image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Backgroud")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        // Customize search bar
        searchBar.layer.cornerRadius = 20
        searchBar.searchTextField.layer.cornerRadius = 10
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.layer.applyShadow(color: UIColor.black, offset: searchBarShadowOffset, opacity: searchBarShadowOpacity, radius: searchBarShadowRadius)

    }
    
    private func setupGestures() {
        podcastViewAll.addTapGesture(target: self, action: #selector(podcastLabelTapped))
        albumViewAll.addTapGesture(target: self, action: #selector(albumLabelTapped))
    }
    
    private func setupCollectionView() {
        setupCollectionView(collectionViewPodcast)
        setupCollectionView(collectionViewAlbum)
        setupCollectionView(collectionViewCountry)
    }
    
    private func setupCollectionView(_ collectionView: UICollectionView) {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Actions
    @objc private func podcastLabelTapped() {
        print("Podcast label tapped!")
    }
    
    @objc private func albumLabelTapped() {
        print("Album label tapped!")
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case collectionViewPodcast:
            return listPodcast.count
        case collectionViewAlbum:
            return listAlbum.count
        case collectionViewCountry:
            return listCountry.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case collectionViewPodcast:
            return configurePodcastCell(for: indexPath)
        case collectionViewAlbum:
            return configureAlbumCell(for: indexPath)
        case collectionViewCountry:
            return configureCountryCell(for: indexPath)
        default:
            return UICollectionViewCell()
        }
    }
    
    // MARK: - Cell Configuration
    private func configurePodcastCell(for indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewPodcast.dequeueReusableCell(withReuseIdentifier: "podcastcell", for: indexPath) as! PoscastCollectionViewCell
        let model = listPodcast[indexPath.row]
        cell.configure(with: model)
        cell.onTap = { label in print("Podcast cell with label '\(label)' tapped") }
        return cell
    }
    
    private func configureAlbumCell(for indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewAlbum.dequeueReusableCell(withReuseIdentifier: "albumcell", for: indexPath) as! AlbumCollectionViewCell
        let model = listAlbum[indexPath.row]
        cell.configure(with: model)
        cell.onTap = { label in print("Album cell with label '\(label)' tapped") }
        return cell
    }
    
    private func configureCountryCell(for indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewCountry.dequeueReusableCell(withReuseIdentifier: "countrycell", for: indexPath) as! CountryCollectionViewCell
        let model = listCountry[indexPath.row]
        cell.configure(with: model)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case collectionViewPodcast:
            print("Selected Podcast: \(listPodcast[indexPath.row].label)")
        case collectionViewAlbum:
            print("Selected Album: \(listAlbum[indexPath.row].label)")
        case collectionViewCountry:
            print("Selected Country: \(indexPath.row)")
        default:
            break
        }
    }
}
