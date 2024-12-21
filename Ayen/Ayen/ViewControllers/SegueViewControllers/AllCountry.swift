import UIKit

class AllCountry: UIViewController {
    
    var listCountry:[Country] = []
    var progessBar: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    private var selectedCountry: Country?
    
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
        
        loadCountry()
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }
    
    func loadCountry() {
        progessBar.startAnimating()
        progessBar.isHidden = false
        
        ApiClient.shared.getAllCountries { result in
            DispatchQueue.main.async {
                self.progessBar.stopAnimating()
                self.progessBar.isHidden = true
                
                switch result {
                case .success(let countries):
                    self.listCountry = countries
                    self.tableView.reloadData()
                case .failure(let error):
                    print("Error fetching genres: \(error)")
                }
            }
        }
    }
    
}

extension AllCountry: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let spacerView = UIView()
        spacerView.backgroundColor = .clear
        return spacerView
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCountry = listCountry[indexPath.section]
        performSegue(withIdentifier: "showAllMusicCountry", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAllMusicCountry" {
            if let destinationVC = segue.destination as? ListTableViewController {
                destinationVC.listLabelText = selectedCountry?.name
                destinationVC.listType = "country"
                destinationVC.listTypeId = selectedCountry?.id
            }
        }
    }
}

extension AllCountry: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return listCountry.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryAllCell", for: indexPath) as! CountryAllCell
        let currentModel = listCountry[indexPath.section]
        cell.configure(currentModel)
        return cell
    }
}
