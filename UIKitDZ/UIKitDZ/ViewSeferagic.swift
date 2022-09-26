//
//  ViewSeferagic.swift
//  UIKitDZ
//
//  Created by Эл on 26.09.2022.
//

import UIKit
import AVFoundation

class ViewSeferagic: UIViewController {
    @IBOutlet weak var mediaSlider: UISlider!

    var song = Song(name: "", artist: "", albumImage: "", song: "")
        var player = AVAudioPlayer()
        var button = UIButton()
        var timer: Timer?

    override func viewDidLoad() {
            super.viewDidLoad()
    }
    @IBAction func playOrPause(_ sender: UIButton) {
        if player.isPlaying {
                        sender.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
                        player.pause()
                    } else {
                        sender.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
                        player.play()
                    }
                    self.view.layoutIfNeeded()
    }
}
