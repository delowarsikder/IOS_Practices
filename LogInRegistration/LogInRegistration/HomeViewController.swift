//
//  HomeViewController.swift
//  LogInRegistration
//
//  Created by Delowar on 11/25/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit
//create struct for get json data
struct Course : Decodable {
    let id:Int
    let name:String
    let link:String
    let imageUrl:String
    let number_of_lessons: Int
}

class HomeViewController: UIViewController {
var dataFromFirst :String = ""
    //productView
    
    @IBOutlet var displayJsonData: UILabel!
    @IBAction func showJsonDataButton(_ sender: Any) {
        let jsonUrl = "https://api.letsbuildthatapp.com/jsondecodable/course"
        guard let url = URL(string: jsonUrl) else {return}
        URLSession.shared.dataTask(with: url) { (data, respons, err) in
            do{
                let course = try JSONDecoder().decode(Course.self, from: data!)
                print(course.imageUrl)
                let link = course.imageUrl
                self.displayJsonData.text = link
            } catch let jsonerr {
                print("Error serializing json",jsonerr)
            }
            
            }.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        displayData.text = dataFromFirst
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
