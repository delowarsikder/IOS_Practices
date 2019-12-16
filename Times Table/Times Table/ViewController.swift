//
//  ViewController.swift
//  Times Table
//
//  Created by Delowar on 10/30/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate        {

    @IBOutlet var slider: UISlider!
    
    @IBOutlet var table: UITableView!
    @IBAction func sliderButton(_ sender: Any) {
//        print(slider.value)
        table.reloadData()
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 50
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
//        cell.textLabel?.text = "Hi there"
        cell.textLabel?.text = String(Int((slider.value) * 20) * (indexPath.row + 1))
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

