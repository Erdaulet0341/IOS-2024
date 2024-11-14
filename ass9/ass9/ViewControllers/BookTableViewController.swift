import UIKit

class BookTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var selectedBook: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadBooks()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? BookDetailView else {
            return
        }
        destVC.configure(with: selectedBook)
    }
}

extension BookTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBook = books[indexPath.row]
        performSegue(withIdentifier: "goBookDetails", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension BookTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookCell
        let currentModel = books[indexPath.row]
        cell.configure(currentModel)
        return cell
    }
}
