import UIKit

class SearchViewController: UIViewController {
    var listLabelText: String?
    var listTrack:[Track] = []
    var progessBar: UIActivityIndicatorView!
    var allTracks: [Track] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var search_bar: UISearchBar!
    
    private var selectedTrack: Track?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        search_bar.layer.cornerRadius = 20
        search_bar.searchTextField.layer.cornerRadius = 10
        
        search_bar.delegate = self
        search_bar.becomeFirstResponder()
        loadTrack()
    }
    
    func loadTrack() {
        progessBar.startAnimating()
        progessBar.isHidden = false

        ApiClient.shared.getAllTracks { result in
            DispatchQueue.main.async {
                self.progessBar.stopAnimating()
                self.progessBar.isHidden = true
                
                switch result {
                case .success(let tracks):
                    self.allTracks = tracks
                    self.listTrack = tracks
                    self.tableView.reloadData()
                case .failure(let error):
                    print("Error fetching tracks: \(error)")
                }
            }
        }
    }
    
    func searchTracks(query: String) {
        guard !query.isEmpty else {
            listTrack = allTracks
            tableView.reloadData()
            return
        }
        
        progessBar.startAnimating()
        progessBar.isHidden = false
        
        ApiClient.shared.searchTracks(query: query) { result in
            DispatchQueue.main.async {
                self.progessBar.stopAnimating()
                self.progessBar.isHidden = true
                
                switch result {
                case .success(let tracks):
                    self.listTrack = tracks
                    self.tableView.reloadData()
                case .failure(let error):
                    print("Error searching tracks: \(error)")
                }
            }
        }
    }
    
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTrack = listTrack[indexPath.row]
        performSegue(withIdentifier: "playmusic", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "playmusic" {
                if let playMusicVC = segue.destination as? PlayMusic {
                    playMusicVC.currentTrack = selectedTrack
                    playMusicVC.listTrack = listTrack
                }
            }
        }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTrack.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchMusicCell", for: indexPath) as! SearchMusicCell
        let currentModel = listTrack[indexPath.row]
        cell.configure(currentModel)
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            listTrack = allTracks
            tableView.reloadData()
        } else {
            searchTracks(query: searchText)
        }
    }
}
