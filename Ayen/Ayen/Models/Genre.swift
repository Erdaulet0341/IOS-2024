import UIKit

struct Genre {
    let image: UIImage
    let name: String
}

var listGenre:[Genre] = []


func loadGenre() {
    listGenre = [
        Genre(image: UIImage(named: "peep-48 1") ?? UIImage(), name: "Genre1"),
        Genre(image: UIImage(named: "peep-48 1") ?? UIImage(), name: "Genre2"),
        Genre(image: UIImage(named: "peep-48 1") ?? UIImage(), name: "Genre3"),
        Genre(image: UIImage(named: "peep-48 1") ?? UIImage(), name: "Genre4"),
        Genre(image: UIImage(named: "peep-48 1") ?? UIImage(), name: "Genre5"),
    ]
}
