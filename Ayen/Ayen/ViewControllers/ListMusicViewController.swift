import UIKit

class ListTableViewController: UIViewController {
    var listLabelText: String?
    var listTrack:[Track] = []
    var progessBar: UIActivityIndicatorView!
    var listType: String?
    var listTypeId: Int?
    
    @IBOutlet weak var tableView: UITableView!
    private var selectedTrack: Track?
    
    @IBOutlet weak var listName: UILabel!
    @IBOutlet weak var backButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listName.text = listLabelText
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Backgroud")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        progessBar = UIActivityIndicatorView(style: .large)
        progessBar.center = view.center
        progessBar.hidesWhenStopped = true
        view.addSubview(progessBar)
        
        tableView.separatorColor = UIColor.clear
        tableView.dataSource = self
        tableView.delegate = self
        loadTrack()
        
        backButton.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        backButton.addGestureRecognizer(tapGesture)
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }
    
    func loadTrack() {
        progessBar.startAnimating()
        progessBar.isHidden = false
        
        guard let listTypeId = listTypeId else { return }
        
        switch listType {
        case "genre":
            ApiClient.shared.getTracksByGenre(genreId: listTypeId) { result in
                DispatchQueue.main.async {
                    self.progessBar.stopAnimating()
                    self.progessBar.isHidden = true
                    
                    switch result {
                    case .success(let tracks):
                        self.listTrack = tracks
                        self.tableView.reloadData()
                    case .failure(let error):
                        print("Error fetching tracks: \(error)")
                    }
                }
            }
        case "artist":
            ApiClient.shared.getTracksByArtist(artistId: listTypeId) { result in
                DispatchQueue.main.async {
                    self.progessBar.stopAnimating()
                    self.progessBar.isHidden = true
                    
                    switch result {
                    case .success(let tracks):
                        self.listTrack = tracks
                        self.tableView.reloadData()
                    case .failure(let error):
                        print("Error fetching tracks: \(error)")
                    }
                }
            }
        case "country":
            ApiClient.shared.getTracksByCountry(countryId: listTypeId) { result in
                DispatchQueue.main.async {
                    self.progessBar.stopAnimating()
                    self.progessBar.isHidden = true
                    
                    switch result {
                    case .success(let tracks):
                        self.listTrack = tracks
                        self.tableView.reloadData()
                    case .failure(let error):
                        print("Error fetching tracks: \(error)")
                    }
                }
            }
        case "album":
            ApiClient.shared.getTracksByAlbum(albumId: listTypeId) { result in
                DispatchQueue.main.async {
                    self.progessBar.stopAnimating()
                    self.progessBar.isHidden = true
                    
                    switch result {
                    case .success(let tracks):
                        self.listTrack = tracks
                        self.tableView.reloadData()
                    case .failure(let error):
                        print("Error fetching tracks: \(error)")
                    }
                }
            }
        default:
            print("Unknown list type: \(listType ?? "nil")")
        }
        
    }
    
}

extension ListTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTrack = listTrack[indexPath.row]
        performSegue(withIdentifier: "playMusicFromList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "playMusicFromList" {
                if let playMusicVC = segue.destination as? PlayMusic {
                    playMusicVC.currentTrack = selectedTrack
                    playMusicVC.listTrack = listTrack
                }
            }
        }
}

extension ListTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTrack.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListMusicCell", for: indexPath) as! ListTrackCell
        let currentModel = listTrack[indexPath.row]
        cell.configure(currentModel)
        return cell
    }
}
