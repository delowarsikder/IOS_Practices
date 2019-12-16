//
//  ViewController.swift
//  json_webDescription
//
//  Created by Delowar on 11/25/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit
struct WebsiteDescription :Decodable{
    let name : String
    let description : String
    let courses: [Course]
}
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
        let jsonUrl = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        guard let url = URL(string: jsonUrl) else {return}
        URLSession.shared.dataTask(with: url) { (data, respons, err) in
            do{
                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data!)
                print(websiteDescription.name + "\n",websiteDescription.description + "\n")
                //this is ok for print id number
                                for i in 0..<websiteDescription.courses.count{
                                    print(websiteDescription.courses[i].id,"\n")
                                }
                
            } catch let jsonerr {
                print("Error serializing json",jsonerr)
            }
            
            }.resume()
        // Do any additional setup after loading the view.
}
    
}
