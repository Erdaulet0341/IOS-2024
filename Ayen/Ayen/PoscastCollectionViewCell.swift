//
//  PoscastCELLCollectionViewCell.swift
//  Ayen
//
//  Created by Yerdaulet on 07.12.2024.
//

struct Podcast {
    let image: UIImage
    let label: String
}

var listPodcast:[Podcast] = [
    Podcast(image: UIImage(named: "peep-48") ?? UIImage(), label: "Podcast1"),
    Podcast(image: UIImage(named: "peep-48") ?? UIImage(), label: "Podcast2"),
    Podcast(image: UIImage(named: "peep-48") ?? UIImage(), label: "Podcast3"),
    Podcast(image: UIImage(named: "peep-48") ?? UIImage(), label: "Podcast4"),
    Podcast(image: UIImage(named: "peep-48") ?? UIImage(), label: "Podcast5"),

]

import UIKit

class PoscastCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
}
