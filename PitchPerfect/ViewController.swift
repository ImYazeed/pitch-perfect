//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Yazeed ALZahrani on 11/29/18.
//  Copyright © 2018 Yazeed ALZahrani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        stopRecordingButton.isEnabled = false
    }
    @IBAction func recordAudio(_ sender: Any) {
        
        setupRecording()
    }
    
    @IBAction func stopRecording(_ sender: Any) {
         recordingLabel.text = "Tap to Record"
        recordButton.isEnabled = true
         stopRecordingButton.isEnabled = false
    }
    
    func setupRecording() {
        stopRecordingButton.isEnabled = true
        recordButton.isEnabled = false
        recordingLabel.text = "Recording in progress"
    }
}

