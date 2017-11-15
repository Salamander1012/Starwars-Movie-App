//
//  MovieViewController.swift
//  Star Wars App
//
//  Created by Salman Fakhri on 11/15/17.
//  Copyright © 2017 Salman Fakhri. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    var text: String = ""
    @IBOutlet weak var movieTitleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTitleLabel.text = text
        
    }

 

}
