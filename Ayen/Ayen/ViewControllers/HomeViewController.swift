import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var imageRight: UIImageView!
    @IBOutlet weak var podcastViewAll: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionViewPodcast: UICollectionView!
    @IBOutlet weak var collectionViewAlbum: UICollectionView!
    @IBOutlet weak var collectionViewCountry: UICollectionView!
    @IBOutlet weak var albumViewAll: UILabel!
    @IBOutlet weak var countryViewAll: UILabel!
    
    private let cornerRadius: CGFloat = 30
    private let searchBarShadowOffset = CGSize(width: 4, height: 4)
    private let searchBarShadowOpacity: Float = 0.4
    private let searchBarShadowRadius: CGFloat = 4
    private var selectedAlbum: Album?
    private var selectedPodcast: Podcast?
    private var selectedCountry: Country?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGestures()
        setupCollectionView()
    }
    
    private func setupUI() {
        imageRight.layer.cornerRadius = cornerRadius
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Backgroud")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        searchBar.layer.cornerRadius = 20
        searchBar.searchTextField.layer.cornerRadius = 10
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.layer.applyShadow(color: UIColor.black, offset: searchBarShadowOffset, opacity: searchBarShadowOpacity, radius: searchBarShadowRadius)
    }
    
    private func setupGestures() {
        podcastViewAll.addTapGesture(target: self, action: #selector(podcastLabelTapped))
        albumViewAll.addTapGesture(target: self, action: #selector(albumLabelTapped))
        countryViewAll.addTapGesture(target: self, action: #selector(countryLabelTapped))
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
    
    @objc private func podcastLabelTapped() {
        print("Podcast label tapped!")
        performSegue(withIdentifier: "showAllPodcast", sender: nil)
    }
    
    @objc private func albumLabelTapped() {
        print("Album label tapped!")
        performSegue(withIdentifier: "showAllAlbum", sender: nil)
    }
    
    @objc private func countryLabelTapped() {
        print("Country label tapped!")
        performSegue(withIdentifier: "showAllCountry", sender: nil)
    }
}

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
    
    private func configurePodcastCell(for indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewPodcast.dequeueReusableCell(withReuseIdentifier: "podcastcell", for: indexPath) as! PoscastCollectionViewCell
        let model = listPodcast[indexPath.row]
        cell.configure(with: model)
        return cell
    }
    
    private func configureAlbumCell(for indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewAlbum.dequeueReusableCell(withReuseIdentifier: "albumcell", for: indexPath) as! AlbumCollectionViewCell
        let model = listAlbum[indexPath.row]
        cell.configure(with: model)
        return cell
    }
    
    private func configureCountryCell(for indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewCountry.dequeueReusableCell(withReuseIdentifier: "countrycell", for: indexPath) as! CountryCollectionViewCell
        let model = listCountry[indexPath.row]
        cell.configure(with: model)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case collectionViewPodcast:
            print("Selected Podcast: \(listPodcast[indexPath.row].label)")
            let selectedPodcast = listPodcast[indexPath.row]
            self.selectedPodcast = selectedPodcast
            performSegue(withIdentifier: "showPodcastDetails", sender: self)
        case collectionViewAlbum:
            print("Selected Album: \(listAlbum[indexPath.row].label)")
            let selectedAlbum = listAlbum[indexPath.row]
            self.selectedAlbum = selectedAlbum
            self.selectedCountry = nil
            performSegue(withIdentifier: "showAllMusic", sender: self)
            
        case collectionViewCountry:
            print("Selected Country: \(indexPath.row)")
            let selectedCountry = listCountry[indexPath.row]
            self.selectedCountry = selectedCountry
            self.selectedAlbum = nil
            performSegue(withIdentifier: "showAllMusic", sender: self)
        default:
            break
        }
    }
}

extension HomeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAllMusic" {
            if let destinationVC = segue.destination as? ListTableViewController {
                if let selectedAlbum = self.selectedAlbum {
                    destinationVC.listLabelText = selectedAlbum.label
                }
                if let selectedCountry = self.selectedCountry {
                    destinationVC.listLabelText = selectedCountry.label
                }
            }
        }
        if segue.identifier == "showPodcastDetails"{
            if let destinationVC = segue.destination as? PodcastDetail {
                if let selectedPodcast = self.selectedPodcast {
                    destinationVC.nameLabelText = selectedPodcast.label
                }
            }
        }
    }
}
