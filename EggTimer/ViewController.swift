//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()

    let cookingTimes = [
        "Soft": 5,
        "Medium": 7,
        "Hard": 12
    ]
    
    var elapsedTime: Int = 0

    @IBOutlet weak var titleLabel: UILabel!

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let time = cookingTimes[sender.currentTitle!]
        
        if time != nil { self.startTimer(time: time!) }
        else { print("Error") }
    }
    
    func startTimer(time: Int) {
        self.timer.invalidate()

        let timeInSeconds = time * 60
    
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.elapsedTime += Int(timer.timeInterval)
            
            if self.elapsedTime <= timeInSeconds {
                self.titleLabel.text = "Cooking: \(timeInSeconds - self.elapsedTime) seconds remaining"
            } else {
                self.elapsedTime = 0
                self.titleLabel.text = "Your egg is ready"
                self.timer.invalidate()
            }
        }
    }
}
