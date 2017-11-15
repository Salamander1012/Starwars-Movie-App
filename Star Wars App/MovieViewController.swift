//
//  MovieViewController.swift
//  Star Wars App
//
//  Created by Salman Fakhri on 11/15/17.
//  Copyright © 2017 Salman Fakhri. All rights reserved.
//

import UIKit
import SwiftyJSON

class MovieViewController: UIViewController {
    
    var movieTitle: String = ""
    var director: String = ""
    var date: String = ""
    var characterApiLinks: [String] = []
    var characters: [Character] = []
    var temp = ["dsada", "dsadas"]
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var characterTableView: UITableView!
    override func viewDidLoad() {
        
    super.viewDidLoad()
        movieTitleLabel.text = movieTitle
        directorLabel.text = director
        releaseDateLabel.text = date
        characterTableView.delegate = self
        characterTableView.dataSource = self
        getData()
    }

}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell") as! CharacterCell
        cell.setUpCell(title: characters[indexPath.row].name!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(characters)
    }
    
}

//Data structures
extension MovieViewController {
    struct Character {
        let name: String?
    }
    
}


//API Call and data setup
extension MovieViewController {
    func getData() {
        var urlString = ""
        let session = URLSession.shared
        
        for link in characterApiLinks {
            urlString = link
            let url = URL(string: urlString)

            session.dataTask(with: url!) { (data, response, error) in
                if let response  = response {
                    //print(response)
                }
                if let data = data {
                    let json = JSON(data: data)
                    self.characters.append(Character(name: json["name"].string))
                }
                DispatchQueue.main.async{
                    self.characterTableView.reloadData()
                }
                
            }.resume()
            
        }
        
        
    }
}
