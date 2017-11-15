//
//  MovieViewController.swift
//  Star Wars App
//
//  Created by Salman Fakhri on 11/15/17.
//  Copyright © 2017 Salman Fakhri. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    var movieTitle: String = ""
    var director: String = ""
    var date: String = ""
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        movieTitleLabel.text = movieTitle
        directorLabel.text = director
        releaseDateLabel.text = date
        
    }

 

}
