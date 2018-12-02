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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func recordAudio(_ sender: Any) {
        recordingLabel.text = "Recording in progress"
    }
    
    @IBAction func stopRecording(_ sender: Any) {
         recordingLabel.text = "Tap to Record"
    }
}

