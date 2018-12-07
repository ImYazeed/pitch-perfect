//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Yazeed ALZahrani on 11/29/18.
//  Copyright © 2018 Yazeed ALZahrani. All rights reserved.
//

import UIKit

import AVFoundation

class recordingViewController: UIViewController, AVAudioRecorderDelegate {
    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    var audioRecorder:AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(isRecording: false)
    }
    
    // MARK: ACTION
    @IBAction func recordAudio(_ sender: Any) {
        setupAndStartRecording()
    }

    
    @IBAction func stopRecording(_ sender: Any) {
        
        configureUI(isRecording: false)
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    // MARK: SETUP RECORDING
    func setupAndStartRecording() {
        
        configureUI(isRecording: true)
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath,recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(.playAndRecord, mode: .default, options: .defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    // MARK: - Audio Recorder Delegate
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
        performSegue(withIdentifier:"stopRecording" , sender: audioRecorder.url)
        }else{
            print("recording was not successful")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "stopRecording" {
            let playSoundVC = segue.destination as! PlaySoundsViewController
            
            let recordedURL = sender as! URL
            playSoundVC.recordedAudioURL = recordedURL
        }
    }
    
    func configureUI(isRecording: Bool){
        
        if isRecording {
            stopRecordingButton.isEnabled = true
            recordButton.isEnabled = false
            recordingLabel.text = "Recording in progress"
        }else {
            recordingLabel.text = "Tap to Record"
            recordButton.isEnabled = true
            stopRecordingButton.isEnabled = false
        }
    }
}

