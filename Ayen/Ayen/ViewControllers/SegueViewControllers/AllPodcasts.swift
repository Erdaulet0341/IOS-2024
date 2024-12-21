import UIKit

class AllPodcasts: UIViewController {
    
    var listPodcast:[Podcast] = []
    var progessBar: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    private var selectedPodcast: Podcast?
    
    @IBOutlet weak var backButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progessBar = UIActivityIndicatorView(style: .large)
        progessBar.center = view.center
        progessBar.hidesWhenStopped = true
        view.addSubview(progessBar)
        
        tableView.separatorColor = UIColor.clear
        tableView.dataSource = self
        tableView.delegate = self
        
        backButton.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        backButton.addGestureRecognizer(tapGesture)
        
        loadPodcast()
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }
    
    func loadPodcast() {
        progessBar.startAnimating()
        progessBar.isHidden = false
        
        ApiClient.shared.getAllPodcasts { result in
            DispatchQueue.main.async {
                self.progessBar.stopAnimating()
                self.progessBar.isHidden = true
                
                switch result {
                case .success(let podcast):
                    self.listPodcast = podcast
                    self.tableView.reloadData()
                case .failure(let error):
                    print("Error fetching podcast: \(error)")
                }
            }
        }
    }
    
    
}

extension AllPodcasts: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 305
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let spacerView = UIView()
        spacerView.backgroundColor = .clear
        return spacerView
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPodcast = listPodcast[indexPath.section]
        performSegue(withIdentifier: "showPodcastDetails", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPodcastDetails" {
            if let destinationVC = segue.destination as? PodcastDetail {
                destinationVC.podcast = selectedPodcast
            }
        }
    }
}

extension AllPodcasts: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return listPodcast.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PodcastAllCell", for: indexPath) as! PodcastAllCell
        let currentModel = listPodcast[indexPath.section]
        cell.configure(currentModel)
        return cell
    }
}
