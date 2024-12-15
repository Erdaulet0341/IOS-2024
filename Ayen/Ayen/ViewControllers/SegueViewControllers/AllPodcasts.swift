import UIKit

class AllPodcasts: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var selectedPodcast: Podcast?
    
    @IBOutlet weak var backButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorColor = UIColor.clear
        tableView.dataSource = self
        tableView.delegate = self
        
        backButton.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        backButton.addGestureRecognizer(tapGesture)
    }
    
    @objc func backButtonTapped() {
        print("Clicked")
        dismiss(animated: true)
    }
    
}

extension AllPodcasts: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
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
                destinationVC.nameLabelText = selectedPodcast?.label
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
