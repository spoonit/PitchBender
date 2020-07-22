//
//  ViewController.swift
//  PitchBender
//
//  Created by Jesus Rios on 3/11/20.
//  Copyright © 2020 Spoon Inc. All rights reserved.
//

import UIKit
import AudioKit
import AudioKitUI

class TunerViewController: UIViewController, TunerDelegate {
    
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var ampLabel: UILabel!
    @IBOutlet var pitchLabel: UILabel!
    @IBOutlet var freqLabel: UILabel!
    
    var tuner = Tuner()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tuner.delegate = self
        tuner.start()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        AKSettings.audioInputEnabled = true
        AudioKit.output = tuner.silence
        do {
            try AudioKit.start()
        } catch {
            print("AudioKit did not start....")
        }
        
    }

    func tunerDidMeasure(pitch: Pitch, distance: Double, amplitude: Double) {
        pitchLabel.text = "Pitch: " + pitch.description
        distanceLabel.text = "Distance: " +  String(format: "%0.2f", distance)
        ampLabel.text = "Amplitude: " + String(format: "%0.2f", amplitude)
        freqLabel.text = "Frequency: " + String(format: "%0.2f", pitch.frequency)
    }

}
