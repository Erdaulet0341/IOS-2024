import UIKit

struct Artist {
    let image: UIImage
    let name: String
    let country: String
}

var listArtist:[Artist] = []


func loadArtist() {
    listArtist = [
        Artist(image: UIImage(named: "peep-48 1") ?? UIImage(), name: "Artist1", country: "Kazakh"),
        Artist(image: UIImage(named: "peep-48 1") ?? UIImage(), name: "Artist2", country: "Kazakh"),
        Artist(image: UIImage(named: "peep-48 1") ?? UIImage(), name: "Artist3", country: "Kazakh"),
        Artist(image: UIImage(named: "peep-48 1") ?? UIImage(), name: "Artist4", country: "Kazakh"),
        Artist(image: UIImage(named: "peep-48 1") ?? UIImage(), name: "Artist5", country: "Kazakh"),

    ]
}
