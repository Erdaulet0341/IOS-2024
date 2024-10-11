//
//  ViewController.swift
//  Xylophone
//
//  Created by Yerdaulet on 10.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // The main container view for all UI elements
    private let mainView = UIView()
    
    // Vertical stack view to organize buttons vertically
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical  // Arrange subviews vertically
        stackView.distribution = .fillEqually  // Make all buttons the same size
        stackView.spacing = 12  // Add space between buttons
        return stackView
    }()
    
    // Array of musical note names for button labels
    private let noteNames = ["A", "B", "C", "D", "E", "F", "G"]
    
    // Audio player for playing sound files
    private var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the main view
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the stack view to the main view
        mainView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set up constraints to position and size the views
        NSLayoutConstraint.activate([
            // Pin main view to the edges of the screen
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Position stack view within main view with some padding
            stackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 80),
            stackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -24),
            stackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -80)
        ])
        
        // Create and add buttons to the stack view
        for noteName in noteNames {
            let button = UIButton(type: .system)
            button.setTitle(noteName, for: .normal)
            
            // Generate a light background color for the button
            let backgroundColor = lightRandomColor()
            button.backgroundColor = backgroundColor
            
            // Set text color to contrast with the background
            button.setTitleColor(contrastingColor(for: backgroundColor), for: .normal)
            
            // Add tap action to the button
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            
            // Add the button to the stack view
            stackView.addArrangedSubview(button)
        }
    }
    
    // Called when a button is tapped
    @objc private func buttonTapped(_ sender: UIButton) {
        // Play the sound corresponding to the tapped button
        playSound(for: sender.titleLabel?.text)
    }
    
    // Generates a light, pastel-like color for button backgrounds
    private func lightRandomColor() -> UIColor {
        let hue = CGFloat.random(in: 0...1)  // Random color
        let saturation = CGFloat.random(in: 0.5...0.8)  // Medium saturation
        let brightness = CGFloat.random(in: 0.8...1.0)  // High brightness for light colors
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
    
    // Determines whether black or white text will contrast better with the given color
    private func contrastingColor(for color: UIColor) -> UIColor {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        // Calculate perceived brightness
        let brightness = (0.299 * red + 0.587 * green + 0.114 * blue)
        
        // Return black for light backgrounds, white for dark backgrounds
        return brightness > 0.6 ? .black : .white
    }
    
    // Plays the sound file corresponding to the given note name
    private func playSound(for noteName: String?) {
        guard let noteName = noteName,
              let audioFileURL = Bundle.main.url(forResource: noteName, withExtension: "wav") else {
            return
        }
        
        // Stop any currently playing audio
        audioPlayer?.stop()
        
        do {
            // Create and play the new audio
            audioPlayer = try AVAudioPlayer(contentsOf: audioFileURL)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
