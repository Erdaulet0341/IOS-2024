import UIKit

struct Movie {
    let title: String
    let year: String
    let genre: String
    let posterImage: UIImage
    let description: String
}

var movies: [Movie] = []

func loadMovies() {
    movies = [
        Movie(
            title: "Inception",
            year: "2010",
            genre: "Sci-Fi",
            posterImage: UIImage(named: "inception") ?? UIImage(),
            description: "Dom Cobb is a skilled thief with the rare ability to 'extract' information from people's minds while they dream. Offered a chance to regain his old life as payment for a task considered impossible: 'inception', the implantation of another person's idea into a target's subconscious. Cobb assembles a team of specialists to help him pull off this elaborate scheme in the world of dreams. As the team goes deeper into layered dreams within dreams, they face increasing dangers where a single mistake could leave them trapped in limbo forever. The line between reality and dreams becomes increasingly blurred as Cobb confronts his own demons while trying to complete the mission."
        ),
        Movie(
            title: "The Shawshank Redemption",
            year: "1994",
            genre: "Drama",
            posterImage: UIImage(named: "shawshank") ?? UIImage(),
            description: "Andy Dufresne, a banker wrongly convicted of murdering his wife and her lover, is sentenced to life imprisonment at Shawshank State Penitentiary. In prison, Andy forms a deep friendship with Red, a fellow inmate known for acquiring contraband items. Over two decades, Andy maintains his innocence while helping the prison staff with financial matters and gradually working to better the prison conditions, including building a library. His hope and determination never waver despite the brutal realities of prison life. After years of careful planning and unwavering patience, Andy orchestrates one of the most memorable prison escapes in cinema history."
        ),
        Movie(
            title: "The Dark Knight",
            year: "2008",
            genre: "Action",
            posterImage: UIImage(named: "darkknight") ?? UIImage(),
            description: "In this epic sequel, Batman raises the stakes in his war on crime in Gotham City. With the help of Lieutenant Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations plaguing the streets. Their partnership proves effective, but they soon find themselves prey to a rising criminal mastermind known as the Joker. The Joker creates a wave of chaos and crime that tests Batman's resolve to fight justice without crossing his moral boundaries. As the Joker's nihilistic plan unfolds, Batman must confront impossible choices that challenge his understanding of heroism, justice, and sacrifice."
        ),
        Movie(
            title: "Pulp Fiction",
            year: "1994",
            genre: "Crime",
            posterImage: UIImage(named: "pulpfiction") ?? UIImage(),
            description: "Quentin Tarantino's masterpiece weaves together three interconnected stories in Los Angeles's criminal underworld. The narrative follows two hitmen, Vincent Vega and Jules Winnfield, who work for mob boss Marsellus Wallace. Their story intersects with Wallace's wife Mia, a mysterious briefcase, and a boxer named Butch Coolidge. Through non-linear storytelling, the film explores themes of honor among thieves, redemption, and consequences. The innovative structure and sharp dialogue revolutionized modern cinema, while creating some of the most iconic scenes in film history."
        ),
        Movie(
            title: "Forrest Gump",
            year: "1994",
            genre: "Drama",
            posterImage: UIImage(named: "forrestgump") ?? UIImage(),
            description: "Forrest Gump, a slow-witted but kind-hearted man from Alabama, recounts his extraordinary life story to strangers while sitting on a bench. His tale spans some of America's most defining historical moments, from the Vietnam War to the Watergate scandal. Throughout his journey, Forrest's pure love for his childhood friend Jenny remains constant, despite their paths continuously diverging and reconnecting. His inadvertent influence on popular culture and history creates a unique perspective on late 20th century America. Despite his limitations, Forrest's simple wisdom and unwavering loyalty touch everyone he meets."
        ),
        Movie(
            title: "The Matrix",
            year: "1999",
            genre: "Sci-Fi",
            posterImage: UIImage(named: "matrix") ?? UIImage(),
            description: "Thomas Anderson, known online as Neo, is a computer programmer who discovers that reality as he knows it is actually a simulation called the Matrix. After being contacted by mysterious rebels led by Morpheus, Neo learns that humanity is trapped in a simulated reality created by sentient machines. Taking the red pill, Neo joins the resistance and begins his training to understand and manipulate the rules of the Matrix. As he grows stronger, Neo discovers he might be 'The One' - a prophesied hero who can end the war between humans and machines. Together with Trinity and Morpheus, Neo fights against the machines' agents while trying to free humanity from their virtual prison."
        ),
        Movie(
            title: "Goodfellas",
            year: "1990",
            genre: "Crime",
            posterImage: UIImage(named: "goodfellas") ?? UIImage(),
            description: "Based on a true story, the film follows Henry Hill's rise through the ranks of the mob from his days as a teenage errand boy to a full-fledged gangster. Along with his friends Jimmy Conway and Tommy DeVito, Henry lives the fast-paced, violent life of a mobster in New York. The film depicts the seductive nature of organized crime, showing both the glamorous and brutal aspects of mob life. As the years progress, Henry's involvement in drugs and paranoia begin to unravel his criminal empire. The story culminates in Henry having to choose between loyalty to his criminal family and saving himself."
        ),
        Movie(
            title: "The Silence of the Lambs",
            year: "1991",
            genre: "Thriller",
            posterImage: UIImage(named: "silenceofthelambs") ?? UIImage(),
            description: "FBI trainee Clarice Starling is recruited to interview imprisoned cannibalistic serial killer Dr. Hannibal Lecter to gain insights into an active serial killer case. The killer, known as 'Buffalo Bill', is kidnapping and murdering young women, and Lecter may hold crucial information to finding him. A complex psychological game develops between Starling and Lecter as she seeks his help while keeping her own demons at bay. As the investigation intensifies, Starling must confront her own past traumas while racing against time to save Buffalo Bill's latest victim. The hunt becomes personal as Starling navigates the twisted minds of two killers while proving herself in a male-dominated profession."
        ),
        Movie(
            title: "Star Wars: Episode IV",
            year: "1977",
            genre: "Sci-Fi",
            posterImage: UIImage(named: "starwars") ?? UIImage(),
            description: "In a galaxy far, far away, young farm boy Luke Skywalker is thrust into an epic conflict between the evil Galactic Empire and the Rebel Alliance. After discovering a secret message from Princess Leia in a droid, Luke joins forces with Jedi Master Obi-Wan Kenobi and smuggler Han Solo. Together with Chewbacca and the droids R2-D2 and C-3PO, they embark on a mission to rescue the princess from the Empire's planet-destroying Death Star. As Luke learns about the mystical Force, he discovers his own destiny in the rebellion. The fate of the galaxy hangs in the balance as the small band of heroes attempts to destroy the Death Star before it can crush the rebellion."
        ),
        Movie(
            title: "The Lord of the Rings: The Fellowship of the Ring",
            year: "2001",
            genre: "Fantasy",
            posterImage: UIImage(named: "lotr") ?? UIImage(),
            description: "In the peaceful Shire, young hobbit Frodo Baggins inherits a ring that turns out to be the One Ring of Power, created by the dark lord Sauron to dominate Middle-earth. Guided by the wizard Gandalf, Frodo must leave his home to begin an epic quest to destroy the ring in the fires of Mount Doom. A fellowship is formed to protect Frodo, consisting of humans, an elf, a dwarf, his hobbit friends, and Gandalf. Their journey takes them through treacherous landscapes while being pursued by Sauron's evil forces. The fellowship faces internal struggles as the ring's corrupting power tests their loyalty and resolve."
        )
    ]
}
