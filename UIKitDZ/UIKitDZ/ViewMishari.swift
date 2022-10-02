//
//  ViewMishari.swift
//  UIKitDZ
//
//  Created by Эл on 26.09.2022.
//

import UIKit
import AVFoundation

/// This is a View Controller created special for artist Mishari Rashid for his recitation

final class ViewMishari: UIViewController {

    // MARK: - Init the AVAudioPlayer
    
    var player: AVAudioPlayer?

    @IBOutlet weak var playButton: UIButton!

    override func viewDidLoad() {
            super.viewDidLoad()
    }

    // MARK: - The player's body
    @IBAction func didTapButton() {
            if let player = player, player.isPlaying {
                player.pause()
            } else {
                let urlString = Bundle.main.path(forResource: "Fatihah", ofType: "mp3")
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                guard let urlString = urlString else {
                    return
                }
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                guard let player = player else {
                    return
                }
                player.play()
            }
            catch {
                print("something went wrong")
            }
        }
    }
}
