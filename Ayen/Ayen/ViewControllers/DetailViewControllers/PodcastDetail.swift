import UIKit
import WebKit

class PodcastDetail: UIViewController {
    var nameLabelText: String?
    
    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var namePodcast: UILabel!
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        namePodcast.text = nameLabelText
        playYouTubeVideo(url: "https://www.youtube.com/watch?v=U1A2ZrXEwxE")
        
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
        print("Clicked")
        dismiss(animated: true)
    }
}
