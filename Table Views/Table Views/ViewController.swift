//
//  ViewController.swift
//  Table Views
//
//  Created by Delowar on 10/30/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    let value = ["Delowar","CSe","2k16","KUET"]
//    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 50  //how many row are filled
//        return value.count
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
//    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
//        cell.textLabel?.text = "Top row"
//        cell.textLabel?.text = value[indexPath.row]  //put value in row
        cell.textLabel?.text = String(indexPath.row + 1)  //show number in row
        return cell
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

