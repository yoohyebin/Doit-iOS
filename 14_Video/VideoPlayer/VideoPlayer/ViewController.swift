//
//  ViewController.swift
//  VideoPlayer
//
//  Created by 유혜빈 on 2022/09/28.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapInternalVideoButton(_ sender: UIButton) {
        let filePath: String? = Bundle.main.path(forResource: "FastTyping", ofType: "mp4")
        let url = NSURL(fileURLWithPath: filePath!)
        
        playVideo(url)
    }
    
    @IBAction func tapExternalVideoButton(_ sender: UIButton) {
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")!
        
        playVideo(url)
    }
    
    private func playVideo(_ url: NSURL){
        let playController = AVPlayerViewController()
        
        let player = AVPlayer(url: url as URL)
        playController.player = player
        
        self.present(playController, animated: true){
            player.play()
        }
    }
}

