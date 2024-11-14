import UIKit

class MusicTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var selectedMusic: Music?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadMusics()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? MusicDetailView else {
            return
        }
        destVC.configure(with: selectedMusic)
    }
}

extension MusicTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMusic = musics[indexPath.row]
        performSegue(withIdentifier: "goMusicDetails", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MusicTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as! MusicCell
        let currentModel = musics[indexPath.row]
        cell.configure(currentModel)
        return cell
    }
}

