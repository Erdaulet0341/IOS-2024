import UIKit

struct Music {
    let title: String
    let year: String
    let genre: String
    let posterImage: UIImage
    let length: String
}

var musics: [Music] = []

func loadMusics() {
    musics = [
        Music(
            title: "To Kill a Mockingbird",
            year: "1960",
            genre: "Fiction",
            posterImage: UIImage(named: "Mask group") ?? UIImage(),
            length: "04:00"
            
        ),
        Music(
            title: "1984",
            year: "1949",
            genre: "Dystopian",
            posterImage: UIImage(named: "Mask group") ?? UIImage(),
            length: "04:00"

        ),
        Music(
            title: "Pride and Prejudice",
            year: "1813",
            genre: "Romance",
            posterImage: UIImage(named: "Mask group") ?? UIImage(),
            length: "04:00"

        ),
        Music(
            title: "The Great Gatsby",
            year: "1925",
            genre: "Classic",
            posterImage: UIImage(named: "Mask group") ?? UIImage(),
            length: "04:00"

        ),
        Music(
            title: "Moby-Dick",
            year: "1851",
            genre: "Adventure",
            posterImage: UIImage(named: "Mask group") ?? UIImage(),
            length: "04:00"

        ),
        Music(
            title: "War and Peace",
            year: "1869",
            genre: "Historical Fiction",
            posterImage: UIImage(named: "Mask group") ?? UIImage(),
            length: "04:00"

        ),
        Music(
            title: "The Catcher in the Rye",
            year: "1951",
            genre: "Fiction",
            posterImage: UIImage(named: "Mask group") ?? UIImage(),
            length: "04:00"

        ),
        Music(
            title: "The Hobbit",
            year: "1937",
            genre: "Fantasy",
            posterImage: UIImage(named: "Mask group") ?? UIImage(),
            length: "04:00"

        ),
        Music(
            title: "Crime and Punishment",
            year: "1866",
            genre: "Psychological Fiction",
            posterImage: UIImage(named: "Mask group") ?? UIImage(),
            length: "04:00"
        ),
        Music(
            title: "The Odyssey",
            year: "8th Century BC",
            genre: "Epic",
            posterImage: UIImage(named: "Mask group") ?? UIImage(),
            length: "04:00")
    ]
}

