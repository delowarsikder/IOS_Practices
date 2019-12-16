//
//  ViewController.swift
//  Cat Years
//
//  Created by Delowar on 10/27/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var showAge: UILabel!
    
    @IBAction func submit_button(_ sender: Any) {
        //print(ageTextField.text as Any)
    //showAge.text=ageTextField.text
         let age = Int(ageTextField.text!)! * 7
        showAge.text = String(age)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

