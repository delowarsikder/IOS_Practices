//
//  ViewController.swift
//  LogInRegistration
//
//  Created by Delowar on 10/2/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        self.performSegue(withIdentifier: "loginView", sender: self);
    } 
}

