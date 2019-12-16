//
//  ViewController.swift
//  Egg Timer
//
//  Created by Delowar on 10/30/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    var time = 0
    
    @IBOutlet var enterTime: UITextField!
    
    @IBAction func submitTIme(_ sender: Any) {
        if enterTime.text != ""{
            time = Int(enterTime.text!)!
            timerLabel.text = String(time)
            enterTime.text = ""
        }
        else{
            timerLabel.text = "please enter number"
        }
    }
    @objc func timerController() {
//        time = time - 1
        if time > 0{
            time -= 1
            timerLabel.text = String(time)
        }else {
            timer.invalidate()
        }
        
    }
    
   
    @IBOutlet var timerLabel: UILabel!
    
    @IBAction func playButton(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timerController) , userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseButton(_ sender: Any) {
    timer.invalidate() // stop time
    }
    
    @IBAction func plusTen(_ sender: Any) {
        time += 10
        timerLabel.text = String(time)
    }
    
   
    @IBAction func minusTen(_ sender: Any) {
        if time > 10 {
            time -= 10
            timerLabel.text = String(time)
        }
        
    }
    
    @IBAction func resetButton(_ sender: Any) {
        timerLabel.text = ""
        timer.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

