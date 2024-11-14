import UIKit

class BookDetailView: UIViewController {
    
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var dismissButton: UIButton!
    
    private var book: Book?
    
    func configure(with book: Book?) {
        self.book = book
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDismissButton()
    }
    
    private func setupUI() {
        titleLabel.text = book?.title
        yearLabel.text = book?.year
        genreLabel.text = book?.genre
        descriptionTextView.text = book?.description
        posterImageView.image = book?.posterImage
    }

    private func setupDismissButton() {
        dismissButton.addTarget(self, action: #selector(dismissTapped), for: .touchUpInside)
    }
        
    @objc private func dismissTapped() {
        dismiss(animated: true)
    }
}
//
//  BookDetailView2.swift
//  ass9
//
//  Created by Yerdaulet on 14.11.2024.
//

