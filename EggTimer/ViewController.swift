//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var timer = Timer()
    
    var audioPlayer: AVAudioPlayer?

    let cookingTimes = [
        "Soft": 1,
        "Medium": 2,
        "Hard": 3
    ]
    
    var elapsedTime: Int = 0

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var progressView: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let time = cookingTimes[sender.currentTitle!]
        
        if time != nil {
            self.startTimer(time: time!)
            self.titleLabel.text = "Cooking \(sender.currentTitle!) egg..."
        }
        else { print("Error") }
    }
    
    func startTimer(time: Int) {
        self.timer.invalidate()

        let timeInSeconds = time * 60
    
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.elapsedTime += Int(timer.timeInterval)
            
            if self.elapsedTime <= timeInSeconds {
                self.progressView.progress = Float(self.elapsedTime) / Float(timeInSeconds)
            } else {
                self.elapsedTime = 0
                self.titleLabel.text = "Your egg is ready"
                self.timer.invalidate()
                self.playAlarmSound()
            }
        }
    }
    
    func playAlarmSound() {
        guard let alarmSoundURL = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else {
            print("Alarm sound file not found")
            return
        }
        
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: alarmSoundURL)
            self.audioPlayer?.play()
        } catch {
            print("Error while playing the alarm audio")
        }
        
    }
}
