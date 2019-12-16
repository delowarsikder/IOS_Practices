//
//  ViewController.swift
//  json2
//
//  Created by Delowar on 11/25/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit
struct Courses : Decodable {
    let id:Int
    let name:String
    let link:String
    let imageUrl:String
    let number_of_lessons: Int    
}
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonUrl = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: jsonUrl) else {return}
        URLSession.shared.dataTask(with: url) { (data, respons, err) in
            do{
                let courses = try JSONDecoder().decode([Courses].self, from: data!)
//                print(courses)
                for i in 0..<courses.count
                {
                    print(i , courses[i].imageUrl + "\n")
                }
                
            } catch let jsonerr {
                print("Error serializing json",jsonerr)
            }
            
            }.resume()
        // Do any additional setup after loading the view.
    }
    
    
}


