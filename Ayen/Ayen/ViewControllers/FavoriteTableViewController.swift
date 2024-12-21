import UIKit

class FavoriteTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var selectedTrack: Track?
    var listTrack:[Track] = []
    var progessBar: UIActivityIndicatorView!

    @IBOutlet weak var backButton: UIImageView!
    
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
        loadTrack()
        
        backButton.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        backButton.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadTrack()
    }
    
    
    @objc func backButtonTapped() {
        tabBarController?.selectedIndex = 0
    }
    
    func loadTrack() {
        let likedTracks = UserDefaultsClient.shared.getLikedTracks()
        self.listTrack = likedTracks
        self.tableView.reloadData()
    }
    
}

extension FavoriteTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTrack = listTrack[indexPath.row]
        performSegue(withIdentifier: "playMusic", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "playMusic" {
                if let playMusicVC = segue.destination as? PlayMusic {
                    playMusicVC.currentTrack = selectedTrack
                    playMusicVC.listTrack = listTrack
                }
            }
        }
}

extension FavoriteTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTrack.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as! TrackCell
        let currentModel = listTrack[indexPath.row]
        cell.configure(currentModel)
        return cell
    }
}
