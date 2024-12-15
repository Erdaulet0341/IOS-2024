import UIKit

class GenreTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var selectedGenre: Genre?
    
    @IBOutlet weak var backButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Backgroud")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        tableView.separatorColor = UIColor.clear
        tableView.dataSource = self
        tableView.delegate = self
        loadGenre()
        
        backButton.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        backButton.addGestureRecognizer(tapGesture)
    }
    
    @objc func backButtonTapped() {
        print("Clicked")
        tabBarController?.selectedIndex = 0
    }
    
}

extension GenreTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 390
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let spacerView = UIView()
        spacerView.backgroundColor = .clear // Match table's background color
        return spacerView
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedGenre = listGenre[indexPath.section]
        performSegue(withIdentifier: "showAllMusicGenre", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAllMusicGenre" {
            if let destinationVC = segue.destination as? ListTableViewController {
                destinationVC.listLabelText = selectedGenre?.name
            }
        }
    }
}

extension GenreTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return listGenre.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GenreCell", for: indexPath) as! GenreCell
        let currentModel = listGenre[indexPath.section]
        cell.configure(currentModel)
        return cell
    }
}
