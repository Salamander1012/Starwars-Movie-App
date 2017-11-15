//
//  CharacterCell.swift
//  Star Wars App
//
//  Created by Salman Fakhri on 11/15/17.
//  Copyright © 2017 Salman Fakhri. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCell (title: String) {
        nameLabel.text = title
    }
    

}
