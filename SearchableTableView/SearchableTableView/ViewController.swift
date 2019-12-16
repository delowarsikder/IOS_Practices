//
//  ViewController.swift
//  SearchableTableView
//
//  Created by Delowar on 12/4/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit
class Developers : Decodable {
    let id:Int
    let name:String
    let link:String
    let imageUrl:String
    let number_of_lessons: Int

    init(id :Int,name:String,link:String,imageUrl:String,number_of_lessons:Int) {
        self.id = id
        self.name = name
        self.link = link
        self.imageUrl = imageUrl
        self.number_of_lessons = number_of_lessons
    }
}

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource,UISearchBarDelegate{
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var table: UITableView!
//    var developers : Developers
    
    var details = [Developers]()
    var animalArray = [Animal]()//set up tabel view
    var currentAnimalArray = [Animal]() //set up current array
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let jsonUrl = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: jsonUrl) else {return}
        URLSession.shared.dataTask(with: url) { (data, respons, err) in
            do{
               let developers = try JSONDecoder().decode([Developers].self, from: data!)
                for i in 0..<developers.count
                {
                    print(developers[i].id , developers[i].name + "\n")
                    
                    self.details.append(Developers(id: developers[i].id, name: developers[i].name, link: developers[i].link, imageUrl: developers[i].imageUrl, number_of_lessons: developers[i].number_of_lessons))
                }
                

            } catch let jsonerr {
                print("Error serializing json",jsonerr)
            }
            
            }.resume()
        
        setUpAnimal();
        setUpSearchBar();
    }
    
    private func setUpAnimal(){
        animalArray.append(Animal(name: "Amber", category: .cat,image: "test.jpg"))
        animalArray.append(Animal(name: "Rename", category: .cat,image: "test.jpg"))
        animalArray.append(Animal(name: "UnKnown", category: .dog,image: "test.jpg"))
        animalArray.append(Animal(name: "UnKnown", category: .dog,image: "test.jpg"))
        animalArray.append(Animal(name: "UnKnown", category: .dog,image: "test.jpg"))
        currentAnimalArray = animalArray
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentAnimalArray.count
//  return details.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as? TableCell else{
            return UITableViewCell()
        }
        cell.ImageView.image = UIImage(named: currentAnimalArray[indexPath.row].image)
        cell.nameLabel.text = currentAnimalArray[indexPath.row].name
        cell.rollLabel.text = currentAnimalArray[indexPath.row].category.rawValue
        //print cell index
        
        cell.cellDelegate =  self
        cell.index = indexPath
//            cell.ImageView?.image = UIImage(named: "test.jpg");
//            cell.nameLabel?.text = self.details[indexPath.row].name
//            cell.rollLabel?.text = self.details[indexPath.row].link
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    //Search bar
    func setUpSearchBar(){
        searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
        currentAnimalArray = animalArray
            table.reloadData()
            return
        }
        currentAnimalArray = animalArray.filter({animal ->Bool in animal.name.lowercased().contains(searchText.lowercased())
            
        })
        table.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    }
}


class Animal{
    let name : String
    let image : String
    let category : AnimalType
    init(name : String,category:AnimalType,image: String) {
        self.name = name
        self.category = category
        self.image = image
    }
}

enum AnimalType :String{
    case cat = "Cat"
    case dog = "Dog"
}


extension ViewController:TableViewNew{
    func onClickCell(index: Int) {
        print(animalArray[index].name)
        print("\(index) is clicked")
    }
    
    
}

