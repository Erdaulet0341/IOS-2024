import UIKit

class ListTableViewController: UIViewController {
    var listLabelText: String?
    
    @IBOutlet weak var tableView: UITableView!
    private var selectedMusic: Music?
    
    @IBOutlet weak var listName: UILabel!
    @IBOutlet weak var backButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listName.text = listLabelText
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Backgroud")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        tableView.separatorColor = UIColor.clear
        tableView.dataSource = self
        tableView.delegate = self
        loadMusics()
        
        backButton.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        backButton.addGestureRecognizer(tapGesture)
    }
    
    @objc func backButtonTapped() {
        print("Clicked")
        dismiss(animated: true)
    }
    
}

extension ListTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMusic = musics[indexPath.row]
        print(selectedMusic?.title)
        performSegue(withIdentifier: "playMusicFromList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "playMusicFromList" {
                if let playMusicVC = segue.destination as? PlayMusic {
                    playMusicVC.currentMusic = selectedMusic
                }
            }
        }
}

extension ListTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListMusicCell", for: indexPath) as! ListMusicCell
        let currentModel = musics[indexPath.row]
        cell.configure(currentModel)
        return cell
    }
}
