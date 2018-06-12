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
    
    enum ButtonType: Int {case snail = 0, rabbit = 1, chipmunk = 2, darkVader = 3, parrot = 4, reverb = 5}
    
    @IBAction func playSoundForButton(_ sender:UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .snail:
            playSound(rate: 0.5)
        case .rabbit:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .darkVader:
            playSound(pitch: -1000)
        case .parrot:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        configureUI(.playing)
    }
    
 
    
    @IBAction func pauseButton(_ sender: Any) {
        stopAudio()
    }
    
    @IBAction func RecordNewSoundButton(_ sender: Any) {
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
}
