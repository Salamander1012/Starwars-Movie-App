//
//  ViewController.swift
//  Star Wars App
//
//  Created by Salman Fakhri on 11/11/17.
//  Copyright © 2017 Salman Fakhri. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    var results: [NSDictionary]?
    var movieCount: Int?
    var movies: [Movie] = []
    var currentIndex = 0;
    var jsonData: JSON?
    var temp = ["das", "dsadasd", "dasdasdas"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        movieTableView.delegate = self
        movieTableView.dataSource = self
        navigationItem.title = "Starwars Movies"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movieSelectedSegue" {
            let nextViewController = (segue.destination as! MovieViewController)
            print(movies[currentIndex].name)
            nextViewController.text  = movies[currentIndex].name!
        }
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
                
                let json = JSON(data: data)
                
                for movie in json["results"] {
                    //print(movie.1["characters"])
                    self.movies.append(Movie(name: movie.1["title"].string, characters: movie.1["characters"].arrayValue.map { $0.stringValue}))
                }
                
                
                
            }
            DispatchQueue.main.async{
                self.movieTableView.reloadData()
            }
            
        }.resume()
    }
    
   
}

//Table View setup
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieCell
        
        
        cell.setUpCell(title: movies[indexPath.row].name!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.currentIndex = indexPath.row
        self.performSegue(withIdentifier: "movieSelectedSegue", sender: self)
    }
}



