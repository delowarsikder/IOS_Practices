//
//  ViewController.swift
//  PrimeFinder
//
//  Created by Delowar on 10/30/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var showAns: UILabel!
    @IBOutlet var valueText: UITextField!
    @IBAction func checkNumber(_ sender: Any) {
        if let userEnterString = valueText.text{
            let userEnterInt = Int(userEnterString)
            if let number = userEnterInt
            {
                var isPrime = true
                if number == 1{
                    isPrime = false
                }
                var i = 2
                while i*i < number {
                    if (number % i == 0)
                    {
                        isPrime = false
                    }
                    i += 1
                }
                if isPrime {
                    showAns.text = "\(number) is prime !"
                }
                else
                {
                    showAns.text = "\(number) is not prime !"
                }
            }
            else
            {
                showAns.text = userEnterString + "\(userEnterInt as Any) Please enter positive number .."
            }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

