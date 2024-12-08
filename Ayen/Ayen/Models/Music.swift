import UIKit

struct Music {
    let title: String
    let year: String
    let genre: String
    let posterImage: UIImage
}

var musics: [Music] = []

func loadMusics() {
    musics = [
        Music(
            title: "To Kill a Mockingbird",
            year: "1960",
            genre: "Fiction",
            posterImage: UIImage(named: "Mask group") ?? UIImage()
            
        ),
        Music(
            title: "1984",
            year: "1949",
            genre: "Dystopian",
            posterImage: UIImage(named: "Mask group") ?? UIImage()
        ),
        Music(
            title: "Pride and Prejudice",
            year: "1813",
            genre: "Romance",
            posterImage: UIImage(named: "Mask group") ?? UIImage()
        ),
        Music(
            title: "The Great Gatsby",
            year: "1925",
            genre: "Classic",
            posterImage: UIImage(named: "Mask group") ?? UIImage()
        ),
        Music(
            title: "Moby-Dick",
            year: "1851",
            genre: "Adventure",
            posterImage: UIImage(named: "Mask group") ?? UIImage()
        ),
        Music(
            title: "War and Peace",
            year: "1869",
            genre: "Historical Fiction",
            posterImage: UIImage(named: "Mask group") ?? UIImage()
        ),
        Music(
            title: "The Catcher in the Rye",
            year: "1951",
            genre: "Fiction",
            posterImage: UIImage(named: "Mask group") ?? UIImage()
        ),
        Music(
            title: "The Hobbit",
            year: "1937",
            genre: "Fantasy",
            posterImage: UIImage(named: "Mask group") ?? UIImage()
        ),
        Music(
            title: "Crime and Punishment",
            year: "1866",
            genre: "Psychological Fiction",
            posterImage: UIImage(named: "Mask group") ?? UIImage()
        ),
        Music(
            title: "The Odyssey",
            year: "8th Century BC",
            genre: "Epic",
            posterImage: UIImage(named: "Mask group") ?? UIImage())
    ]
}

