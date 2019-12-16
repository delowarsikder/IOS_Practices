//
//  ViewController.swift
//  jsoneasy1
//
//  Created by Delowar on 11/25/19.
//  Copyright © 2019 Delowar. All rights reserved.
//
import UIKit
struct Course : Decodable {
    let id:Int
    let name:String
    let link:String
    let imageUrl:String
    let number_of_lessons: Int

}
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonUrl = "https://api.letsbuildthatapp.com/jsondecodable/course"
        guard let url = URL(string: jsonUrl) else {return}
        URLSession.shared.dataTask(with: url) { (data, respons, err) in
            do{
                let course = try JSONDecoder().decode(Course.self, from: data!)
                print(course.imageUrl)
                
            } catch let jsonerr {
                print("Error serializing json",jsonerr)
            }
            
            }.resume()
        // Do any additional setup after loading the view.
    }
    
    
}

