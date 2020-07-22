//
//  Tuner.swift
//  PitchBender
//
//  Created by Jesus Rios on 3/11/20.
//  Copyright © 2020 Jesus Rios. All rights reserved.
//

import Foundation
import AudioKit

protocol TunerDelegate {
    func tunerDidMeasure(pitch: Pitch, distance: Double, amplitude: Double)
}

class Tuner : NSObject {
    var delegate: TunerDelegate?
    
    var timer: Timer?
    let mic: AKMicrophone!
    let tracker: AKFrequencyTracker!
    let silence: AKBooster!

    override init() {
        mic = AKMicrophone()
        tracker = AKFrequencyTracker(mic)
        silence = AKBooster(tracker, gain: 0)
    }

    func start() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(measure), userInfo: nil, repeats: true)
    }
    
    func stop() {
        tracker.stop()
        mic.stop()
        timer?.invalidate()
    }
    
    @objc func measure() {
        let frequency = Double(tracker.frequency)
        let amplitude = Double(tracker.amplitude)
        
        let pitch = Pitch.nearest(frequency)
        let distance = frequency - pitch.frequency
        self.delegate?.tunerDidMeasure(pitch: pitch, distance: distance, amplitude: amplitude)
    }
}
