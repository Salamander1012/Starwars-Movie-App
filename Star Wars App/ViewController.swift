//
//  ViewController.swift
//  Star Wars App
//
//  Created by Salman Fakhri on 11/11/17.
//  Copyright © 2017 Salman Fakhri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    var results: [NSDictionary]?
    var movieCount: Int?
    var movies: [Movie] = []
    var currentIndex = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        movieTableView.delegate = self
        movieTableView.dataSource = self
        navigationItem.title = "Starwars Movies"
        
    }
}

//Data structures
extension ViewController {
    struct Movie {
        let name: String?
        let characters: [String]
    }
}

//API Call and Datastructure setup
extension ViewController {
    func getData() {
        guard let url = URL(string: "https://swapi.co/api/films") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response  = response {
                //print(response)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    //print(json as! NSDictionary)
                    if let results = (json as! NSDictionary).value(forKey: "results") {
                        self.results = results as! [NSDictionary]
                    }
                    if let count = (json as! NSDictionary).value(forKey: "count") {
                        self.movieCount = count as! Int
                    }
                    self.setUpDataStructure()
                    self.movieTableView.reloadData()
                    print(self.movies)
                } catch {
                    print(error)
                }
                
            }
            
        }.resume()
    }
    
    func  setUpDataStructure() {
        for movie in results! {
            var name = (movie as! NSDictionary).value(forKey: "title") as! String
            var characters = (movie as! NSDictionary).value(forKey: "characters") as! [String]
            movies.append(Movie(name: name, characters: characters))
        }
    }
}

//Table View setup
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieCell
        
        cell.setUpCell(title: movies[indexPath.row].name ?? "title")
        
        return cell
    }
}



