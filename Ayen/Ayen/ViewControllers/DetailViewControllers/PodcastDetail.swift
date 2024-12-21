import UIKit
import WebKit

class PodcastDetail: UIViewController {
    var podcast: Podcast?
    
    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var namePodcast: UILabel!
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let podcast = podcast else {
            return
        }
        
        namePodcast.text = podcast.title
        playYouTubeVideo(url: podcast.video_url)
        
        backButton.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        backButton.addGestureRecognizer(tapGesture)
    }

    func playYouTubeVideo(url: String) {
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }
}
