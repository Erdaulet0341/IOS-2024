import UIKit

class MovieTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the table view
        tableView.dataSource = self
        tableView.delegate = self
        
        // Load movie data
        loadMovies()
    }
    
    func loadMovies() {
        // For this example, we'll create some dummy data
        movies = [
            Movie(title: "Inception", year: "2010", genre: "Sci-Fi", posterImage: UIImage(named: "inception") ?? UIImage()),
            Movie(title: "The Shawshank Redemption", year: "1994", genre: "Drama", posterImage: UIImage(named: "shawshank") ?? UIImage()),
            Movie(title: "The Dark Knight", year: "2008", genre: "Action", posterImage: UIImage(named: "darkknight") ?? UIImage()),
            Movie(title: "Pulp Fiction", year: "1994", genre: "Crime", posterImage: UIImage(named: "pulpfiction") ?? UIImage()),
            Movie(title: "Forrest Gump", year: "1994", genre: "Drama", posterImage: UIImage(named: "forrestgump") ?? UIImage()),
            Movie(title: "The Matrix", year: "1999", genre: "Sci-Fi", posterImage: UIImage(named: "matrix") ?? UIImage()),
            Movie(title: "Goodfellas", year: "1990", genre: "Crime", posterImage: UIImage(named: "goodfellas") ?? UIImage()),
            Movie(title: "The Silence of the Lambs", year: "1991", genre: "Thriller", posterImage: UIImage(named: "silenceofthelambs") ?? UIImage()),
            Movie(title: "Star Wars: Episode IV", year: "1977", genre: "Sci-Fi", posterImage: UIImage(named: "starwars") ?? UIImage()),
            Movie(title: "The Lord of the Rings: The Fellowship of the Ring", year: "2001", genre: "Fantasy", posterImage: UIImage(named: "lotr") ?? UIImage())
        ]
    }
    
    func showToast(message: String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-100, width: 300, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

// MARK: - UITableViewDataSource
extension MovieTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell else {
            fatalError("Unable to dequeue MovieCell")
        }
        
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MovieTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120 // Adjust this value based on your cell design
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        showToast(message: "You clicked \(movie.title)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
