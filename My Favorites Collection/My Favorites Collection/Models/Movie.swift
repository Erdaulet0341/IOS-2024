import UIKit

struct Movie {
    let title: String
    let year: String
    let genre: String
    let posterImage: UIImage
}

var movies: [Movie] = []

func loadMovies() {
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
