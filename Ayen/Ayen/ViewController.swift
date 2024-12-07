import UIKit
import Alamofire
import Kingfisher

class TracksViewController: UIViewController {
    
    var tableView: UITableView!
    var tracks: [Track] = []
    var isLoading = false
    var offset = 0
    let limit = 100
    var artistID: String = "31e7b30b-f960-408f-908b-c8e277308eab"  // ID артиста по умолчанию

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadMoreTracks()
    }

    func setupTableView() {
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TrackTableViewCell.self, forCellReuseIdentifier: "TrackCell")
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func loadMoreTracks() {
        guard !isLoading else { return }
        isLoading = true

        MusicBrainzAPI.fetchTracks(artistID: artistID, limit: limit, offset: offset) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let newTracks):
                    self.tracks.append(contentsOf: newTracks)
                    self.offset += self.limit
                    self.tableView.reloadData()
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
                self.isLoading = false
            }
        }
    }

    func formatTime(_ length: Int) -> String {
        let minutes = length / 60000
        let seconds = (length % 60000) / 1000
        return String(format: "%d:%02d", minutes, seconds)
    }
}

extension TracksViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell", for: indexPath) as? TrackTableViewCell else {
            return UITableViewCell()
        }
        
        let track = tracks[indexPath.row]
        cell.titleLabel.text = track.title
        if let length = track.length {
            cell.lengthLabel.text = "Length: \(formatTime(length))"
        } else {
            cell.lengthLabel.text = "Unknown length"
        }

        if indexPath.row == tracks.count - 1 {
            loadMoreTracks()
        }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
