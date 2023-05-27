//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let cookingTimes = [
        "Soft": 5,
        "Medium": 7,
        "Hard": 12
    ]
    
    var elapsedTime: Double = 0.0

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let time = cookingTimes[sender.currentTitle!]
        
        if time != nil { self.startTimer(time: time!) }
        else { print("Error") }
    }
    
    func startTimer(time: Int) {
        let timeInSeconds: Double = Double(time) * 60.0
    
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.elapsedTime += timer.timeInterval
            
            if self.elapsedTime <= timeInSeconds {
                print("Cooking: \(timeInSeconds - self.elapsedTime) seconds remaining")
            } else {
                self.elapsedTime = 0.0
                print("Egg is ready!")
                timer.invalidate()
            }
        }
    }
}
