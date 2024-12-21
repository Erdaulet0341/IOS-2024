import UIKit

class HomeViewController: UIViewController {
    
    var listCountry:[Country] = []
    var listAlbum:[Album] = []
    var listPodcast:[Podcast] = []
    
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

    var progressBar: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGestures()
        setupCollectionView()
        setupProgressBar()
        loadCountry()
        loadAlbum()
        loadPodcast()
    }
    
    private func setupProgressBar() {
        progressBar = UIActivityIndicatorView(style: .large)
        progressBar.center = view.center
        progressBar.hidesWhenStopped = true
        progressBar.isHidden = true
        view.addSubview(progressBar)
    }
    
    func loadPodcast() {
        showProgressBar()
        
        ApiClient.shared.getAllPodcasts(limit: 4, offset: 0) { result in
            DispatchQueue.main.async {
                self.hideProgressBar()
                
                switch result {
                case .success(let podcast):
                    self.listPodcast = podcast
                    self.collectionViewPodcast.reloadData()
                case .failure(let error):
                    print("Error fetching podcast: \(error)")
                }
            }
        }
    }
    
    func loadAlbum() {
        showProgressBar()

        ApiClient.shared.getAllAlbums(limit: 4, offset: 0) { result in
            DispatchQueue.main.async {
                self.hideProgressBar()
                
                switch result {
                case .success(let albums):
                    self.listAlbum = albums
                    self.collectionViewAlbum.reloadData()
                case .failure(let error):
                    print("Error fetching albums: \(error)")
                }
            }
        }
    }
    
    func loadCountry() {
        showProgressBar()

        ApiClient.shared.getAllCountries(limit: 4, offset: 0) { result in
            DispatchQueue.main.async {
                self.hideProgressBar()
                
                switch result {
                case .success(let countries):
                    self.listCountry = countries
                    self.collectionViewCountry.reloadData()
                case .failure(let error):
                    print("Error fetching country: \(error)")
                }
            }
        }
    }
    
    private func showProgressBar() {
        if !progressBar.isAnimating {
            progressBar.isHidden = false
            progressBar.startAnimating()
        }
    }

    private func hideProgressBar() {
        if progressBar.isAnimating {
            progressBar.stopAnimating()
            progressBar.isHidden = true
        }
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
        performSegue(withIdentifier: "showAllPodcast", sender: nil)
    }
    
    @objc private func albumLabelTapped() {
        performSegue(withIdentifier: "showAllAlbum", sender: nil)
    }
    
    @objc private func countryLabelTapped() {
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
            let selectedPodcast = listPodcast[indexPath.row]
            self.selectedPodcast = selectedPodcast
            performSegue(withIdentifier: "showPodcastDetails", sender: self)
        case collectionViewAlbum:
            let selectedAlbum = listAlbum[indexPath.row]
            self.selectedAlbum = selectedAlbum
            self.selectedCountry = nil
            performSegue(withIdentifier: "showAllMusic", sender: self)
            
        case collectionViewCountry:
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
                    destinationVC.listLabelText = selectedAlbum.title
                    destinationVC.listType = "album"
                    destinationVC.listTypeId = selectedAlbum.id
                }
                if let selectedCountry = self.selectedCountry {
                    destinationVC.listLabelText = selectedCountry.name
                    destinationVC.listType = "country"
                    destinationVC.listTypeId = selectedCountry.id
                }
            }
        }
        if segue.identifier == "showPodcastDetails"{
            if let destinationVC = segue.destination as? PodcastDetail {
                if let selectedPodcast = self.selectedPodcast {
                    destinationVC.podcast = selectedPodcast
                }
            }
        }
    }
}

