import UIKit

struct Music {
    let title: String
    let year: String
    let genre: String
    let posterImage: UIImage
    let description: String
}

var musics: [Music] = []

func loadMusics() {
    musics = [
        Music(
            title: "Thriller",
            year: "1982",
            genre: "Pop",
            posterImage: UIImage(named: "thriller") ?? UIImage(),
            description: "Michael Jackson's landmark album, 'Thriller,' became the best-selling album of all time with its mix of pop, rock, and R&B. Known for its hit songs like 'Beat It,' 'Billie Jean,' and the title track, 'Thriller,' the album solidified Jackson's status as the King of Pop."
        ),
        Music(
            title: "The Dark Side of the Moon",
            year: "1973",
            genre: "Progressive Rock",
            posterImage: UIImage(named: "darksideofmoon") ?? UIImage(),
            description: "Pink Floyd's 'The Dark Side of the Moon' is a concept album exploring themes of conflict, greed, and mental illness. With iconic tracks like 'Time' and 'Money,' the album became one of the most influential and best-selling rock albums in history."
        ),
        Music(
            title: "Abbey Road",
            year: "1969",
            genre: "Rock",
            posterImage: UIImage(named: "abbeyroad") ?? UIImage(),
            description: "The Beatles' 'Abbey Road' showcases the band's musical range with classics like 'Come Together,' 'Here Comes the Sun,' and 'Something.' The album is celebrated for its cohesive sound and is considered one of the band's best works."
        ),
        Music(
            title: "Back to Black",
            year: "2006",
            genre: "Soul",
            posterImage: UIImage(named: "backtoblack") ?? UIImage(),
            description: "Amy Winehouse's 'Back to Black' features her soulful voice and personal lyrics. With hits like 'Rehab' and 'Back to Black,' the album reflects themes of heartbreak and resilience, leaving a lasting impact on modern soul and pop music."
        ),
        Music(
            title: "Rumours",
            year: "1977",
            genre: "Rock",
            posterImage: UIImage(named: "rumours") ?? UIImage(),
            description: "Fleetwood Mac's 'Rumours' became a defining album of the 1970s. The band navigated personal turmoil to create classics like 'Go Your Own Way' and 'Dreams,' producing a timeless sound that resonates across generations."
        ),
        Music(
            title: "The Wall",
            year: "1979",
            genre: "Rock",
            posterImage: UIImage(named: "thewall") ?? UIImage(),
            description: "Pink Floyd's 'The Wall' is a rock opera that tells the story of a troubled rock star isolating himself from society. Known for songs like 'Another Brick in the Wall' and 'Comfortably Numb,' the album delves into themes of abandonment and self-destruction."
        ),
        Music(
            title: "Nevermind",
            year: "1991",
            genre: "Grunge",
            posterImage: UIImage(named: "nevermind") ?? UIImage(),
            description: "Nirvana's 'Nevermind' brought grunge music to the mainstream with its raw sound and angst-filled lyrics. With hits like 'Smells Like Teen Spirit,' the album became an anthem for a generation and solidified Nirvana's place in rock history."
        ),
        Music(
            title: "A Night at the Opera",
            year: "1975",
            genre: "Rock",
            posterImage: UIImage(named: "anightattheopera") ?? UIImage(),
            description: "Queen's 'A Night at the Opera' showcases the band's eclectic style, from hard rock to operatic influences. The album features the iconic 'Bohemian Rhapsody,' blending rock and classical elements in an unforgettable composition."
        ),
        Music(
            title: "Goodbye Yellow Brick Road",
            year: "1973",
            genre: "Pop/Rock",
            posterImage: UIImage(named: "goodbyeyellowbrickroad") ?? UIImage(),
            description: "Elton John's 'Goodbye Yellow Brick Road' captures his flamboyant style and diverse sound. With songs like 'Candle in the Wind' and 'Bennie and the Jets,' the album is a pop rock masterpiece that highlights John's musical versatility."
        ),
        Music(
            title: "Hotel California",
            year: "1976",
            genre: "Rock",
            posterImage: UIImage(named: "hotelcalifornia") ?? UIImage(),
            description: "The Eagles' 'Hotel California' is known for its title track, a haunting narrative about excess and fame. The album blends rock with country influences and captures the darker side of the American Dream."
        )
    ]
}

