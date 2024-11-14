import UIKit

struct Book {
    let title: String
    let year: String
    let genre: String
    let posterImage: UIImage
    let description: String
}

var books: [Book] = []

func loadBooks() {
    books = [
        Book(
            title: "To Kill a Mockingbird",
            year: "1960",
            genre: "Fiction",
            posterImage: UIImage(named: "tokillamockingbird") ?? UIImage(),
            description: "Harper Lee's classic novel is a tale of racial injustice and childhood innocence set in the Deep South. Through the eyes of young Scout Finch, the story explores the prejudices of a small town as her father, lawyer Atticus Finch, defends a black man accused of raping a white woman. A powerful narrative about morality, empathy, and the human condition."
        ),
        Book(
            title: "1984",
            year: "1949",
            genre: "Dystopian",
            posterImage: UIImage(named: "1984") ?? UIImage(),
            description: "George Orwell's chilling depiction of a totalitarian society under the watchful eye of Big Brother. In a world where individuality and freedom are crushed, Winston Smith attempts to rebel against the oppressive regime, questioning his own sanity and reality as he navigates a world built on lies."
        ),
        Book(
            title: "Pride and Prejudice",
            year: "1813",
            genre: "Romance",
            posterImage: UIImage(named: "prideandprejudice") ?? UIImage(),
            description: "Jane Austen's timeless romance centers around Elizabeth Bennet, a sharp-witted young woman, and the aloof Mr. Darcy. Their initially antagonistic relationship evolves, as misunderstandings give way to admiration and love, revealing the social class and gender dynamics of early 19th-century England."
        ),
        Book(
            title: "The Great Gatsby",
            year: "1925",
            genre: "Classic",
            posterImage: UIImage(named: "thegreatgatsby") ?? UIImage(),
            description: "F. Scott Fitzgerald's novel captures the opulence and excess of the Jazz Age through the enigmatic Jay Gatsby, who is obsessed with winning back his lost love, Daisy Buchanan. A critique of the American Dream, the story exposes the disillusionment behind the glamor and wealth of the Roaring Twenties."
        ),
        Book(
            title: "Moby-Dick",
            year: "1851",
            genre: "Adventure",
            posterImage: UIImage(named: "mobydick") ?? UIImage(),
            description: "Herman Melville's epic tale of obsession and revenge follows Captain Ahab's relentless pursuit of the white whale, Moby-Dick. Through the narration of Ishmael, the novel explores themes of fate, free will, and the destructive power of obsession as Ahab's quest leads to tragedy."
        ),
        Book(
            title: "War and Peace",
            year: "1869",
            genre: "Historical Fiction",
            posterImage: UIImage(named: "warandpeace") ?? UIImage(),
            description: "Leo Tolstoy's monumental novel chronicles the lives of Russian aristocrats as they navigate love, family, and war during the Napoleonic era. Spanning a vast array of characters and events, the novel explores the impact of history on individual lives and the search for meaning in a chaotic world."
        ),
        Book(
            title: "The Catcher in the Rye",
            year: "1951",
            genre: "Fiction",
            posterImage: UIImage(named: "catcherintherye") ?? UIImage(),
            description: "J.D. Salinger's novel follows the troubled teenager Holden Caulfield as he wanders New York City, grappling with grief, loneliness, and disillusionment with adulthood. A landmark in American literature, the novel captures the struggles of adolescence and the desire to protect innocence."
        ),
        Book(
            title: "The Hobbit",
            year: "1937",
            genre: "Fantasy",
            posterImage: UIImage(named: "thehobbit") ?? UIImage(),
            description: "J.R.R. Tolkien's classic fantasy novel follows Bilbo Baggins, a reluctant hobbit who is swept into an epic quest to reclaim treasure from the dragon Smaug. Along the way, he encounters trolls, elves, and goblins, ultimately discovering courage and resourcefulness within himself."
        ),
        Book(
            title: "Crime and Punishment",
            year: "1866",
            genre: "Psychological Fiction",
            posterImage: UIImage(named: "crimeandpunishment") ?? UIImage(),
            description: "Fyodor Dostoevsky's novel delves into the mind of Raskolnikov, a man who commits murder to test his own moral theories. As guilt consumes him, the story explores themes of redemption, justice, and the human psyche's complexities."
        ),
        Book(
            title: "The Odyssey",
            year: "8th Century BC",
            genre: "Epic",
            posterImage: UIImage(named: "theodyssey") ?? UIImage(),
            description: "Homer's epic poem recounts the adventures of Odysseus as he journeys home after the Trojan War, facing mythical creatures and divine challenges. A timeless tale of heroism, loyalty, and resilience that has shaped Western literature for centuries."
        )
    ]
}

