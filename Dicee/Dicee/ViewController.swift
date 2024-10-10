//
//  ViewController.swift
//  Dicee
//
//  Created by Yerdaulet on 10.10.2024.
//

import UIKit

class ViewController: UIViewController {

    // Outlets for the two dice image views
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    // Array of dice image names
    let diceImages = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize dice images when the view loads
        diceImageView1.image = UIImage(named: diceImages[0])
        diceImageView2.image = UIImage(named: diceImages[5])  // Changed from [6] to [5] as array indices go from 0 to 5
    }

    // Action method for the roll button
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        rollDice()
    }
    
    // Function to roll the dice
    func rollDice() {
        // Generate a random index for the first die
        let randomIndex1 = Int.random(in: 0..<diceImages.count)
        
        // Generate a random index for the second die
        var randomIndex2 = Int.random(in: 0..<diceImages.count)
            
        // Ensure the two dice don't show the same image
        while randomIndex2 == randomIndex1 {
            randomIndex2 = Int.random(in: 0..<diceImages.count)
        }
            
        // Set the dice images using the random indices
        diceImageView1.image = UIImage(named: diceImages[randomIndex1])
        diceImageView2.image = UIImage(named: diceImages[randomIndex2])
    }
}
