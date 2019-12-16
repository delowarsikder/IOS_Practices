//
//  ViewController.swift
//  Menu Bar
//
//  Created by Delowar on 10/30/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
var time = Timer()
    @IBAction func addProduct(_ sender: Any) {
        print("Add produce")
        time.invalidate()
    }
    @objc func processTimer (){
        print("A second has passed")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        time = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(processTimer), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }


}

