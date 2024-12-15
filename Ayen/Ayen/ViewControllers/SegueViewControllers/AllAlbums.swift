import UIKit

class AllAlbums: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var selectedAlbum: Album?
    
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

extension AllAlbums: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let spacerView = UIView()
        spacerView.backgroundColor = .clear
        return spacerView
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedAlbum = listAlbum[indexPath.section]
        performSegue(withIdentifier: "getListMusic", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getListMusic" {
            if let destinationVC = segue.destination as? ListTableViewController {
                destinationVC.listLabelText = selectedAlbum?.label
            }
        }
    }
}

extension AllAlbums: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return listAlbum.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumAllCell", for: indexPath) as! AlbumAllCell
        let currentModel = listAlbum[indexPath.section]
        cell.configure(currentModel)
        return cell
    }
}
