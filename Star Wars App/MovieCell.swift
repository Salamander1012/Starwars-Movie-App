//
//  MovieCell.swift
//  Star Wars App
//
//  Created by Salman Fakhri on 11/12/17.
//  Copyright © 2017 Salman Fakhri. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCell (title: String) {
        movieTitle.text = title
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
