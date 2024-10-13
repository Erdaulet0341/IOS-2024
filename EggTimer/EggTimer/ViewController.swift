//
//  ViewController.swift
//  EggTimer
//
//  Created by Yerdaulet on 12.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var progressView: UIProgressView! // Progress bar to show timer progress
    @IBOutlet weak var timeLabel: UILabel! // Label to display remaining time
    @IBOutlet var eggButtons: [UIButton]! // Array of buttons for different egg hardness levels
    
    // MARK: - Properties
    var timer: Timer? // Timer object to manage countdown
    var totalTime = 0 // Total cooking time in seconds
    var secondsRemaining = 0 // Remaining cooking time in seconds
    
    var player: AVAudioPlayer? // Audio player for alarm sound

    // Dictionary to store cooking times for different egg hardness levels
    let eggTimes = [
        0: 300, // Soft: 5 minutes
        1: 420, // Medium: 7 minutes
        2: 720  // Hard: 12 minutes
    ]

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize the UI
        progressView.progress = 0.0
        timeLabel.text = "00:00"
    }

    // MARK: - Action Methods
    @IBAction func eggButtonTapped(_ sender: UIButton) {
        resetTimer() // Reset the timer before starting a new one
        animateButtonTap(sender) // Animate the button tap for visual feedback
        
        let hardness = sender.tag // Get the hardness level from the button's tag
        totalTime = eggTimes[hardness] ?? 0 // Set the total time based on hardness
        secondsRemaining = totalTime // Initialize remaining time
        
        updateTimerLabel() // Update the timer label immediately
        
        // Start a new timer that fires every second
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateTimer()
        }
    }
    
    // MARK: - Helper Methods
    func resetTimer() {
        timer?.invalidate() // Stop the current timer if it's running
        progressView.progress = 0.0 // Reset progress bar to 0
        timeLabel.text = "00:00" // Reset timer label
    }
    
    func updateTimer() {
        if secondsRemaining > 0 {
            secondsRemaining -= 1 // Decrement remaining time
            let progress = Float(totalTime - secondsRemaining) / Float(totalTime) // Calculate progress
            progressView.progress = progress // Update progress bar
            updateTimerLabel() // Update timer label
            print("Updating timer: \(timeLabel.text ?? ""), Progress: \(progress)")
        } else {
            timer?.invalidate() // Stop the timer
            playAlarmSound() // Play alarm when timer finishes
            print("Timer finished")
        }
    }
    
    func updateTimerLabel() {
        let minutes = secondsRemaining / 60 // Calculate minutes
        let seconds = secondsRemaining % 60 // Calculate seconds
        timeLabel.text = String(format: "%02d:%02d", minutes, seconds) // Update label with formatted time
    }
    
    func playAlarmSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url) // Initialize audio player with alarm sound
            player?.play() // Play the alarm sound
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    func animateButtonTap(_ button: UIButton) {
        // Animate button shrinking
        UIView.animate(withDuration: 0.1, animations: {
            button.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            // Animate button returning to original size
            UIView.animate(withDuration: 0.1) {
                button.transform = CGAffineTransform.identity
            }
        }
    }
}
