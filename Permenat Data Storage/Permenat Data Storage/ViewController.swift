//
//  ViewController.swift
//  Permenat Data Storage
//
//  Created by Delowar on 10/30/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        UserDefaults.standard.set("Delowar",forKey: "name")
        let nameObject = UserDefaults.standard.object(forKey: "name")
        if let name = nameObject as? String{
            print(name as Any)
        }
        //array
        let arr = [1,2,3,4]
        UserDefaults.standard.set(arr, forKey: "array")
        let arrayObject = UserDefaults.standard.object(forKey: "array")
        if let array = arrayObject as? NSArray{
            print(array)
        }
        
        
        
    }
}

