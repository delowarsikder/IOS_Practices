//
//  ViewController.swift
//  Button_Text
//
//  Created by Delowar on 10/27/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameText: UITextField!
    @IBOutlet var labelText: UILabel!
    @IBAction func submitBt(_ sender: Any) {
        labelText.text=nameText.text
        print("submit button press")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

