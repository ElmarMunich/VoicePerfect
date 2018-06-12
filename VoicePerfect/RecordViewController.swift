//
//  RecordViewController.swift
//  VoicePerfect
//
//  Created by ELMAR BAYER on 07.06.18.
//  Copyright © 2018 ELMAR BAYER. All rights reserved.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController, AVAudioRecorderDelegate {
    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
   
 // using the AVAudioRecorder in various functions for starting and stopping recording
    var audioRecorder: AVAudioRecorder!

    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(_ sender: Any) {
        recordingLabel.text = "Recording in Progress!"
        stopRecordingButton.isEnabled = true
        recordButton.isEnabled = false
        
        // place to store audio in the documents directory
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        // recording name
        let recordingName = "recordedVoice.wav"
        // creating a path to the audio file
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        // shared audio session over the device
        let session = AVAudioSession.sharedInstance()
        // setting up a session for recording and playing audio, note the "!" means it doesn't handle any errors
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        //preparing the audio recorder and record
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        recordButton.isEnabled = true
        stopRecordingButton.isEnabled = false
        recordingLabel.text = "Tap to start recording"
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        // checks if the recording was successful, if true segue is performed otherwise a message is sent to the console
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("recording failed!")
        }
    }
        // after finishing recording the path of the audio file is sent to the segue "stopRecording" 9.14
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "stopRecording" {
                let playSoundsVC = segue.destination as! PlayViewController
                let recordedAudioURL = sender as! URL
                playSoundsVC.recordedAudioURL = recordedAudioURL
            }
        }
    }
    


