//
//  ViewController.swift
//  How Many Fingure
//
//  Created by Delowar on 10/29/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var fingerNumber: UITextField!
   
    @IBOutlet var showAns: UILabel!
    @IBAction func gausseBt(_ sender: Any) {
//        print("guess press");
        let diceRoll = String(arc4random_uniform(6))
        if fingerNumber.text == diceRoll{
            showAns.text="You're right"
        }
        else{
            showAns.text="Wrong! It was a : "+diceRoll+"."
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

