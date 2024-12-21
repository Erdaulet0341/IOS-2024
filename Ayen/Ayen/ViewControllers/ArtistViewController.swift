import UIKit

class ArtistTableViewController: UIViewController {
    
    var listArtist:[Artist] = []
    var progessBar: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    private var selectedArtist: Artist?
    
    @IBOutlet weak var backButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progessBar = UIActivityIndicatorView(style: .large)
        progessBar.center = view.center
        progessBar.hidesWhenStopped = true
        view.addSubview(progessBar)
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Backgroud")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        tableView.separatorColor = UIColor.clear
        tableView.dataSource = self
        tableView.delegate = self
        loadArtist()
        
        backButton.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        backButton.addGestureRecognizer(tapGesture)
    }
    
    @objc func backButtonTapped() {
        tabBarController?.selectedIndex = 0
    }
    
    func loadArtist() {
        progessBar.startAnimating()
        progessBar.isHidden = false
        
        ApiClient.shared.getAllArtists { result in
            DispatchQueue.main.async {
                self.progessBar.stopAnimating()
                self.progessBar.isHidden = true
                
                switch result {
                case .success(let artists):
                    self.listArtist = artists
                    self.tableView.reloadData()
                case .failure(let error):
                    print("Error fetching genres: \(error)")
                }
            }
        }
    }
    
}

extension ArtistTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let spacerView = UIView()
        spacerView.backgroundColor = .clear
        return spacerView
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedArtist = listArtist[indexPath.section]
        performSegue(withIdentifier: "showAllMusicArtist", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAllMusicArtist" {
            if let destinationVC = segue.destination as? ListTableViewController {
                destinationVC.listLabelText = selectedArtist?.name
                destinationVC.listType = "artist"
                destinationVC.listTypeId = selectedArtist?.id
            }
        }
    }
}

extension ArtistTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return listArtist.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistCell", for: indexPath) as! ArtistCell
        let currentModel = listArtist[indexPath.section]
        cell.configure(currentModel)
        return cell
    }
}
