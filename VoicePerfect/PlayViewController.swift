//
//  PlayViewController.swift
//  VoicePerfect
//
//  Created by ELMAR BAYER on 07.06.18.
//  Copyright © 2018 ELMAR BAYER. All rights reserved.
//

import UIKit
import AVFoundation

class PlayViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var darkVaderButton: UIButton!
    @IBOutlet weak var parrotButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var recordNewSoundButton: UIButton!
    
    // variable for receiving audio from the RecordViewController
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    
    @IBAction func playSoundForButton(_ sender: Any) {
    }
    
    @IBAction func pauseButton(_ sender: Any) {
    }
    
    @IBAction func RecordNewSoundButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
