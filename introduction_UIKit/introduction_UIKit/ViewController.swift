//
//  ViewController.swift
//  introduction_UIKit
//
//  Created by Valentina Terekhova on 09/11/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    var timer: Timer = Timer()
    var count: Int = 0
    var timerCounting: Bool = false
    var isActive: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeground), name: UIApplication.didBecomeActiveNotification, object: nil)
        
    }

//    app activity notifications
    
    @objc func appMovedToBackground() {isActive = false}
    @objc func appMovedToForeground() {isActive = true}
    
    private func updateState() {
        startButton.isEnabled = !timerCounting
        stopButton.isEnabled = timerCounting
        if timerCounting && isActive {
            startTimer()
        } else {
            timer.invalidate()
        }
    }
    
//    button interactions
    
    @IBAction func startTapped(_ sender: Any) {
        timerCounting = true
        updateState()
    }
    
    @IBAction func stopTapped(_ sender: Any) {
        timerCounting = false
        updateState()
    }
    
//    timer implemetation
    
    @objc func timerCounter() {
        count += 1
        let secs = String(format: "%02d", count % 60)
        let mins = String(format: "%02d", count / 60)
        
        timerLabel.text = "\(mins):\(secs)"
    }
    
    @objc func startTimer() {
        let timer = Timer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        self.timer = timer
        RunLoop.main.add(timer, forMode: .common)
    }
}
