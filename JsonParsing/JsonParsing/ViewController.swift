//
//  ViewController.swift
//  JsonParsing
//
//  Created by Delowar on 11/25/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit
struct Course {
    let id:Int
    let name:String
    let link:String
    let imageUrl:String
    let number_of_lessons: Int
    
    init(json:[String: Any]) {
        id = json["id"] as? Int ?? -1
        name = json["name"] as? String ?? ""
        link = json["link"] as? String ?? ""
        imageUrl = json["imageUrl"] as? String ?? ""
        number_of_lessons = json["number_of_lessons"] as? Int ?? -1
    }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       let jsonUrl = "https://api.letsbuildthatapp.com/jsondecodable/course"
        guard let url = URL(string: jsonUrl) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, respons, err) in
            //print data in normal with \ format
//            let dataAsString = String (data: data!,encoding: .utf8)
//            print(dataAsString) print json data
//
            //print data in json format
            do{
                
//this code for json swift 2/3/objc
                                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                //create object
                let course = Course (json: json as! [String : Any])
                print(course.name)
                
            } catch let jsonerr {
                print("Error serializing json",jsonerr)
            }
            
        }.resume()
        // Do any additional setup after loading the view.
    }


}

