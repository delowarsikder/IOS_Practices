//
//  ViewController.swift
//  jsonMissingField
//
//  Created by Delowar on 11/26/19.
//  Copyright © 2019 Delowar. All rights reserved.
//


import UIKit
struct WebsiteDescription :Decodable{
    let name : String
    let description : String
    let courses: [Course]
}
struct Course : Decodable {
    let id:Int?
    let name:String?
    let link:String?
    let imageUrl:String?
    let number_of_lessons: Int?
    
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonUrl = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
        guard let url = URL(string: jsonUrl) else {return}
        URLSession.shared.dataTask(with: url) { (data, respons, err) in
            do{
                let courses = try JSONDecoder().decode([Course].self, from: data!)
//                print(courses)  //print all data
                for i in 0..<courses.count{
                    print(i,courses[i].name ?? String.self)      //add String.self for remove extra text          }
            } catch let jsonerr {
                print("Error serializing json",jsonerr)
            }
            
            }.resume()
        // Do any additional setup after loading the view.
    }
    
}

