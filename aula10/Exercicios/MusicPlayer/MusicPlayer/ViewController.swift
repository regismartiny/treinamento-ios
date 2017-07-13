//
//  ViewController.swift
//  MusicPlayer
//
//  Created by InfraCWI on 13/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, PlayerDelegate {

    @IBOutlet weak var playerCommandsView: Player!
    
    var audioPlayer : AVAudioPlayer?
    
    @IBOutlet weak var labelStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.playerCommandsView.delegate = self
        
        let alertSound = URL(fileURLWithPath: Bundle.main.path(forResource: "Developers", ofType: "mp3")!)
        print(alertSound)
        
        try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try! AVAudioSession.sharedInstance().setActive(true)
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: alertSound)
            audioPlayer!.prepareToPlay()
        }
        catch {
            print("Error getting the audio file")
        }
    }
    
    func doPlay() {
        print("play")
        self.audioPlayer?.play()
        self.labelStatus.text = "Playing"
    }
    
    func doPause() {
        print("pause")
        self.audioPlayer?.pause()
        self.labelStatus.text = "Paused"
    }

   

}

